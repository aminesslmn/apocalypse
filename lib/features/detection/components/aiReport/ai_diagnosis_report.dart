import 'dart:io';

import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiagnosisCard extends StatelessWidget {
  String medicine = "", disease = "", url = "";
  double accuracy = 0.0;

  DiagnosisCard({super.key, medicine_, disease_, accuracy_, url_}) {
    medicine = medicine_;
    disease = disease_;
    accuracy = accuracy_;
    url = url_;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryColor1,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd MMMM yyyy').format(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    disease,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      color: AppColors.iconColor1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Suggested Medicine: $medicine',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Accuracy: $accuracy',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                    ),
                    maxLines: null,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                File(url), // Make sure to add your image to the assets folder
                width: 80,
                height: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
