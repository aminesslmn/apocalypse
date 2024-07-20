import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreFeatures extends StatelessWidget {
  final String? svgAssetPath; // Path to the SVG asset (replace with actual path)
  final String title;
  final Color backgroundColor;
  final Color iconColor;

  const MoreFeatures({
    Key? key,
    this.svgAssetPath,
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 120.0, // Adjust item width as needed
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0), // Optional rounded corners
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered SVG icon
            svgAssetPath != null
                ? Center(
                    child: SvgPicture.asset(
                      svgAssetPath!,
                      color: iconColor, // Apply iconColor here
                      height: 30.0, // Adjust icon size as needed
                    ),
                  )
                : const SizedBox(), // Placeholder if no SVG path provided
            SizedBox(height: 10.0), // Space between icon and title
            // Title positioned at the bottom with some padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: TextStyle(color: AppColors.mainDark, fontSize: 14.0),
                textAlign: TextAlign.center, // Center the text
                maxLines: 2, // Limit to two lines
                overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
              ),
            ),
          ],
        ),
      ),
    );
  }
}
