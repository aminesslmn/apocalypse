import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SkinCareStep extends StatelessWidget {
  final String iconPath;
  final String instructionText;

  const SkinCareStep({
    Key? key,
    required this.iconPath,
    required this.instructionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns items to the start of the row
      children: [
        SvgPicture.asset(
          iconPath,
          width: 26,
          height: 26,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            instructionText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
