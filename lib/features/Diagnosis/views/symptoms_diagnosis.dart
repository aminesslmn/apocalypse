import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/services/diagnosis.dart';
import 'package:flutter/material.dart';
import "package:apocalypsea2sv/features/Diagnosis/components/input_controller.dart";
import "package:apocalypsea2sv/features/Diagnosis/components/diagnosis_container.dart";

class SymptomsDiagnosisPage extends StatefulWidget {
  const SymptomsDiagnosisPage({super.key});

  @override
  State<SymptomsDiagnosisPage> createState() => _SymptomsDiagnosisPageState();
}

class _SymptomsDiagnosisPageState extends State<SymptomsDiagnosisPage> {
  bool _showDiagnosis =
      false; // boolean to track whether to show the response container
  final TextEditingController _textController = TextEditingController();
  String aiReply = "Diagnosis result will appear here...";
  bool _loading = false;

  Future<void> _sendSymptoms() async {
    setState(() {
      _loading = true;
    });

    String? status =
        await DiagnosisService().sendSymptoms(context, _textController.text);

    if (status != null) {
      aiReply = status;

      _showDiagnosis = true;

      setState(() {});
    }

    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Describe your Symptoms",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            InputContainer(
              textController: _textController,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _loading
                  ? null
                  : () {
                      _sendSymptoms();
                    },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.main,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              icon: _loading
                  ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Icon(Icons.feedback),
              label: const Text('Generate Diagnosis'),
            ),
            const SizedBox(height: 20),
            if (_showDiagnosis)
              DiagnosisContainer(
                diagnosisText: aiReply,
              ),
          ],
        ),
      ),
    );
  }
}
