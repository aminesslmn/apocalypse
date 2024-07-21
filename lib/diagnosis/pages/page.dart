import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/diagnosis/components/mainPage/instruction.dart';
import 'package:apocalypsea2sv/diagnosis/components/mainPage/uploadpicarea.dart';
import 'package:flutter/material.dart';

class TapTapHome extends StatefulWidget {
  @override
  _TapTapHomeState createState() => _TapTapHomeState();
}

class _TapTapHomeState extends State<TapTapHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Add SingleChildScrollView here
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Diagnose Your Skin Condition',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Take or upload a photo of your skin to find out if it\'s healthy or if it requires medical attention.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 20),
                Center(child: Uploadpicarea()),
                SizedBox(
                  height: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Instructions for more accurate results',
                      style: TextStyle(
                        color: AppColors.iconColor1,
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 14),
                    SkinCareStep(
                      iconPath: "assets/icons/sparkles.svg",
                      instructionText: 'Ensure the skin is clean.',
                    ),
                    SizedBox(height: 14),
                    SkinCareStep(
                      iconPath: "assets/icons/sun.svg",
                      instructionText:
                          'Use natural light but avoid direct sunlight to prevent glare.',
                    ),
                    SizedBox(height: 14),
                    SkinCareStep(
                      iconPath: "assets/icons/eye.svg",
                      instructionText: 'Make sure the picture is in focus.',
                    ),
                    SizedBox(height: 14),
                    SkinCareStep(
                      iconPath: "assets/icons/pic.svg",
                      instructionText:
                          'Fill most of the frame with the affected area.',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
