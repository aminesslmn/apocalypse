import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/diagnosis/components/diagnosis_done/diagnosis_report_row.dart';
import 'package:apocalypsea2sv/diagnosis/components/diagnosis_done/image_area.dart';
import 'package:apocalypsea2sv/diagnosis/models/diagnosis_response_api.dart';
import 'package:apocalypsea2sv/diagnosis/pages/ai_diagnosis_report.dart';
import 'package:flutter/material.dart';

class DiagnosisDone extends StatelessWidget {
  DiagnosisResponseAPI? diagnosis;
  String imageURL = "";

  DiagnosisDone({super.key, Map<String, dynamic>? diagnosis_, imageURL_}) {
    print(diagnosis);
    diagnosis = DiagnosisResponseAPI(
      disease_: diagnosis_?["disease"],
      accuracy_: diagnosis_?["accuracy"],
      medicine_: diagnosis_?["medicine"],
      causes_: diagnosis_?["llm_response"]["causes"],
      description_: diagnosis_?["llm_response"]["description"],
      treatement_: diagnosis_?["llm_response"]["treatement"],
    );
    imageURL = imageURL_;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Add SingleChildScrollView here
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Diagnose Your Skin Condition',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Take or upload a photo of your skin to find out if it\'s healthy or if it requires medical attention.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ImageArea(
                    url_: imageURL,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Diagnosis Results',
                        style: TextStyle(
                          color: AppColors.iconColor3,
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 14),
                      DiagnosisReportRow(
                        fieldName_: "Diagnosis",
                        fieldValue_: diagnosis?.disease,
                        isHighlighted_: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DiagnosisReportRow(
                        fieldName_: "Suggested Medicine",
                        fieldValue_: diagnosis?.medicine,
                        isHighlighted_: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DiagnosisReportRow(
                        fieldName_: "Accuracy",
                        fieldValue_: diagnosis?.accuracy.toString(),
                        isHighlighted_: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: const WidgetStatePropertyAll(
                      Size(double.infinity, 50),
                    ),
                    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                    backgroundColor: const WidgetStatePropertyAll<Color>(
                      AppColors.iconColor3,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AiDiagnosisReport(
                          diagnosis_: diagnosis,
                          url_: imageURL,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "See More",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
