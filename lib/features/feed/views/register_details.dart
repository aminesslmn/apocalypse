import 'package:apocalypsea2sv/config/ui_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart' as auth_provider;

class RegisterDetailsScreen extends StatefulWidget {
  const RegisterDetailsScreen({super.key});

  @override
  _RegisterDetailsScreenState createState() => _RegisterDetailsScreenState();
}

class _RegisterDetailsScreenState extends State<RegisterDetailsScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedHealthCondition = 'None';
  String selectedAllergy = 'None';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<auth_provider.AuthProvider>(context);
    print("#######################################");
    print(authProvider.fullName);

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
                    child: Form(
                      key: _formKey,
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
                          TextFormField(
                            controller: _ageController,
                            decoration: const InputDecoration(
                              labelText: 'Age',
                              labelStyle: TextStyle(color: AppColors.main),
                              prefixIcon: Icon(Icons.calendar_today,
                                  color: AppColors.main),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your age';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _genderController,
                            decoration: const InputDecoration(
                              labelText: 'Gender',
                              labelStyle: TextStyle(color: AppColors.main),
                              prefixIcon:
                                  Icon(Icons.person, color: AppColors.main),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your gender';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.withOpacity(0.1),
                              labelText: 'Existing Health Conditions',
                              labelStyle:
                                  const TextStyle(color: AppColors.main),
                              prefixIcon: const Icon(Icons.medical_services,
                                  color: AppColors.main),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                            ),
                            value: selectedHealthCondition,
                            items: [
                              'None',
                              'Diabetes',
                              'Hypertension',
                              'Asthma'
                            ].map<DropdownMenuItem<String>>((String value) {
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
                          const SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.withOpacity(0.1),
                              labelText: 'Allergies',
                              labelStyle:
                                  const TextStyle(color: AppColors.main),
                              prefixIcon: const Icon(Icons.warning,
                                  color: AppColors.main),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                            ),
                            value: selectedAllergy,
                            items: ['None', 'Peanuts', 'Shellfish', 'Pollens']
                                .map<DropdownMenuItem<String>>((String value) {
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
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // Save additional user details in AuthProvider
                                authProvider.setUserDetails(
                                  _ageController.text.trim(),
                                  _genderController.text.trim(),
                                  selectedHealthCondition,
                                  selectedAllergy,
                                );

                                // Perform the final Firebase signup
                                await authProvider
                                    .createUserWithEmailAndPassword(
                                  authProvider.email!,
                                  'your_password_here', // replace with your actual password
                                );

                                if (authProvider.error == null) {
                                  // Navigate to the next screen
                                  Navigator.pushNamed(context, '/next-screen');
                                }
                              }
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
                          const SizedBox(height: 10),
                          if (authProvider.isLoading)
                            const CircularProgressIndicator(),
                          if (authProvider.error != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                authProvider.error!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                // Skip and navigate to the next screen
                                Navigator.pushNamed(context, '/next-screen');
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
