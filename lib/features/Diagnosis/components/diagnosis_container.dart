import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagnosisContainer extends StatelessWidget {
  String diagnosisText = "";
  final String iconPath = 'assets/icons/ai.svg';

  DiagnosisContainer({super.key, required this.diagnosisText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Diagnosis',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SvgPicture.asset(
                iconPath,
                height: 24.0,
                width: 24.0,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            diagnosisText,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
