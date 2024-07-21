import 'package:apocalypsea2sv/features/detection/components/aiReport/ai_diagnosis_report.dart';
import 'package:apocalypsea2sv/features/detection/components/aiReport/description_section.dart';
import 'package:apocalypsea2sv/features/detection/models/diagnosis_response_api.dart';
import 'package:flutter/material.dart';

class AiDiagnosisReport extends StatelessWidget {
  DiagnosisResponseAPI? diagnosis;
  String url = "";

  AiDiagnosisReport({super.key, diagnosis_, url_}) {
    diagnosis = diagnosis_;
    url = url_;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiagnosisCard(
                disease_: diagnosis?.disease,
                medicine_: diagnosis?.medicine,
                accuracy_: diagnosis?.accuracy,
                url_: url,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    DescriptionSection(
                      title: 'Disease Description',
                      content: diagnosis?.llmResponse?.description ?? "",
                    ),
                    const SizedBox(height: 10),
                    DescriptionSection(
                      title: 'Causes',
                      content: diagnosis?.llmResponse?.causes ?? "",
                    ),
                    const SizedBox(height: 10),
                    DescriptionSection(
                      title: 'Treatement',
                      content: diagnosis?.llmResponse?.treatement ?? "",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
