import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class DiagnosisReportRow extends StatelessWidget {
  String fieldName = "", fieldValue = "";
  bool isHighlighted = false;

  DiagnosisReportRow({super.key, fieldName_, fieldValue_, isHighlighted_}) {
    fieldName = fieldName_;
    fieldValue = fieldValue_;
    isHighlighted = isHighlighted_;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns items to the start of the row
      children: [
        SizedBox(
          width: 110,
          child: Text(
            fieldName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            fieldValue,
            style: TextStyle(
              color: isHighlighted ? AppColors.iconColor1 : Colors.black,
              fontSize: 17,
              fontFamily: 'Lato',
              fontWeight: isHighlighted ? FontWeight.w900 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
