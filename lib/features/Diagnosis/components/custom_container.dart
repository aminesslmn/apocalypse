import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure you have this package in your pubspec.yaml

class CustomContainer extends StatelessWidget {
  final String title;
  final String content;
  final Color titleColor;
  final Color contentColor;
  final Color backgroundColor;
  final bool showIcon;
  final String? iconPath; // Path to SVG icon
  final Color iconColor; // Color for the icon

  const CustomContainer({
    Key? key,
    required this.title,
    required this.content,
    this.titleColor = Colors.black,
    this.contentColor = Colors.black87,
    this.backgroundColor = Colors.white,
    this.showIcon = false,
    this.iconPath,
    this.iconColor = Colors.black, // Default color for the icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Default padding
      margin: EdgeInsets.all(8.0), // Default margin
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0), // Default border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              if (showIcon && iconPath != null) ...[
                Spacer(), // Pushes the icon to the right
                SvgPicture.asset(
                  iconPath!,
                  color: iconColor, // Match icon color with provided color
                  height: 24.0, // Adjust height as needed
                  width: 24.0, // Adjust width as needed
                ),
              ],
            ],
          ),
          SizedBox(height: 8.0), // Default spacing between title and content
          Text(
            content,
            style: TextStyle(
              color: contentColor,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
