import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class RegisterDetailsScreen extends StatefulWidget {
  const RegisterDetailsScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegisterDetailsScreen> {
  final Map<String, dynamic> formFields = {
    'Age': {
      'label': 'Age',
      'icon': Icons.calendar_today,
      'inputType': TextInputType.number,
    },
    'Gender': {
      'label': 'Gender',
      'icon': Icons.person,
      'inputType': TextInputType.text,
    },
    'Existing Health Conditions': {
      'label': 'Existing Health Conditions',
      'icon': Icons.medical_services,
      'inputType': TextInputType.text,
      'options': ['None', 'Diabetes', 'Hypertension', 'Asthma'],
    },
    'Allergies': {
      'label': 'Allergies',
      'icon': Icons.warning,
      'inputType': TextInputType.text,
      'options': ['None', 'Peanuts', 'Shellfish', 'Pollens'],
    },
  };

  String selectedHealthCondition = 'None';
  String selectedAllergy = 'None';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/robot.png',
              fit: BoxFit.cover,
            ),
          ),
          // Wave image at the bottom
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: screenWidth,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Image.asset(
                'assets/wave.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Overlay content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 50), // Add some space at the top
                  Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.fill,
                        width: screenWidth * 0.6,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  // Registration form
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.01),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Register",
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Few more things for a personalized experience.",
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...formFields.entries.map((entry) {
                          if (entry.key == 'Existing Health Conditions') {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.green.withOpacity(0.1),
                                  labelText: entry.value['label'],
                                  labelStyle:
                                      const TextStyle(color: AppColors.main),
                                  prefixIcon: Icon(entry.value['icon'],
                                      color: AppColors.main),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.main),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.main),
                                  ),
                                ),
                                value: selectedHealthCondition,
                                items: entry.value['options']
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedHealthCondition = newValue!;
                                  });
                                },
                              ),
                            );
                          } else if (entry.key == 'Allergies') {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.green.withOpacity(0.1),
                                  labelText: entry.value['label'],
                                  labelStyle:
                                      const TextStyle(color: AppColors.main),
                                  prefixIcon: Icon(entry.value['icon'],
                                      color: AppColors.main),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.main),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.main),
                                  ),
                                ),
                                value: selectedAllergy,
                                items: entry.value['options']
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedAllergy = newValue!;
                                  });
                                },
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.green.withOpacity(0.1),
                                  labelText: entry.value['label'],
                                  labelStyle:
                                      const TextStyle(color: AppColors.main),
                                  prefixIcon: Icon(entry.value['icon'],
                                      color: AppColors.main),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.main),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.main),
                                  ),
                                ),
                                keyboardType: entry.value['inputType'],
                              ),
                            );
                          }
                        }),
                        ElevatedButton(
                          onPressed: () {
                            // Define your action here
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            backgroundColor: AppColors.main,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              // Define your action here
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(color: AppColors.main),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
