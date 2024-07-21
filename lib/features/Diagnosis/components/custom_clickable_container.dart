import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomClickableContainer extends StatelessWidget {
  final String leftIconPath;
  final String title;
  final String rightIconPath;
  final Color iconColor;
  final VoidCallback onTap;

  // Positioning customization variables
  final MainAxisAlignment rowAlignment;
  final CrossAxisAlignment crossAlignment;

  const CustomClickableContainer({
    Key? key,
    required this.leftIconPath,
    required this.title,
    required this.rightIconPath,
    required this.iconColor,
    required this.onTap,
    this.rowAlignment = MainAxisAlignment.spaceBetween,
    this.crossAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: rowAlignment,
          crossAxisAlignment: crossAlignment,
          children: [
            // Left Icon
            SvgPicture.asset(
              leftIconPath,
              color: iconColor,
              height: 24.0,
              width: 24.0,
            ),
            // Title
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            // Right Icon
            SvgPicture.asset(
              rightIconPath,
              color: iconColor,
              height: 24.0,
              width: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
