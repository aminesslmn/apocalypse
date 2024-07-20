import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class HealthTip extends StatelessWidget {
  final String dailyTip;
  final Color color;

  const HealthTip({
    Key? key,
    required this.dailyTip,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(15.0), // Set desired corner radius
            color: color // Set background color,
            ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: AppColors.main,
                ),
                SizedBox(width: 10.0), // Adjust spacing as needed
                Text(
                  "Daily Health Tip",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.main,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                dailyTip,
                style: TextStyle(
                  fontSize:
                      14.0, // Adjust font size for readability and overflow
                  color: AppColors.mainDark,
                ),
                maxLines: 4, // Optionally limit the number of lines displayed
                overflow:
                    TextOverflow.ellipsis, // Handle overflow with ellipsis
              ),
            ),
          ],
        ));
  }
}
