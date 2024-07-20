import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/diagnosis/components/instruction.dart';
import 'package:apocalypsea2sv/diagnosis/components/uploadpicarea.dart';
import 'package:flutter/material.dart';

class TapTapHome extends StatefulWidget {
  const TapTapHome({super.key});

  @override
  _TapTapHomeState createState() => _TapTapHomeState();
}

class _TapTapHomeState extends State<TapTapHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Diagnose Your Skin Condition',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Take or upload a photo of your skin to find out if it\'s healthy or if it requires medical attention.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              const Center(child: Uploadpicarea()),
              const SizedBox(
                height: 24,
              ),
              Container(
                child: const Column(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}