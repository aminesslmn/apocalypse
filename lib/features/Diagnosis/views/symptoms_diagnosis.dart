import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SymptomsDiagnosisPage extends StatefulWidget {
  const SymptomsDiagnosisPage({super.key});

  @override
  State<SymptomsDiagnosisPage> createState() => _SymptomsDiagnosisPageState();
}

class _SymptomsDiagnosisPageState extends State<SymptomsDiagnosisPage> {
  bool _showDiagnosis =
      false; // boolean to track whether to show the response container

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Describe your Symptoms",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20),
            InputContainer(
              onSubmit: () {
                setState(() {
                  _showDiagnosis =
                      true; // Show diagnosis container when submit is clicked
                });
              },
            ),
            SizedBox(height: 20),
            if (_showDiagnosis)
              DiagnosisContainer(), // Conditionally show diagnosis container
          ],
        ),
      ),
    );
  }
}

class InputContainer extends StatefulWidget {
  final VoidCallback
      onSubmit; // Callback to notify parent when submit is clicked

  const InputContainer({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _InputContainerState createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  final TextEditingController _textController = TextEditingController();

  void _handleButtonPress() {
    final inputText = _textController.text;
    // here we send the inputText to the API
    print('User typed: $inputText');
    _textController.clear();
    widget.onSubmit(); // Notify parent that submit was clicked
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _textController,
              maxLines: null, // Allows the TextField to expand vertically
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type here...',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _handleButtonPress,
          child: Text('Generate Diagnosis'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.main,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }
}

class DiagnosisContainer extends StatelessWidget {
  final String diagnosisText = "Diagnosis result will appear here.";
  final String iconPath = 'assets/icons/ai.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Diagnosis',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(flex: 1,),
              
              SvgPicture.asset(
                iconPath,
                height: 24.0,
                width: 24.0,
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            diagnosisText,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
