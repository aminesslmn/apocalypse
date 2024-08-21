import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPatient = true;
  int currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for patient registration
  final TextEditingController _patientFullNameController =
      TextEditingController();
  final TextEditingController _patientEmailController = TextEditingController();
  final TextEditingController _patientPasswordController =
      TextEditingController();
  final TextEditingController _patientConfirmPasswordController =
      TextEditingController();
  final TextEditingController _patientAgeController = TextEditingController();
  final TextEditingController _patientCountryController =
      TextEditingController();
  final TextEditingController _patientGenderController =
      TextEditingController();
  final TextEditingController _patientHealthConditionsController =
      TextEditingController();
  final TextEditingController _patientAllergiesController =
      TextEditingController();
  final TextEditingController _patientConfirmationCodeController =
      TextEditingController();

  // Controllers for doctor registration
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _doctorEmailController = TextEditingController();
  final TextEditingController _doctorCountryController =
      TextEditingController();
  final TextEditingController _doctorSpecialityController =
      TextEditingController();
  final TextEditingController _doctorYearsOfExpController =
      TextEditingController();
  final TextEditingController _doctorConfirmationCodeController =
      TextEditingController();
  final TextEditingController _doctorPasswordController =
      TextEditingController();
  final TextEditingController _doctorConfirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
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
                  // Add some space at the top
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.fill,
                        width: screenWidth * 0.6,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  // Registration form
                  const SizedBox(height: 50),
                  Container(
                    width: screenWidth * 0.85,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Register",
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Toggle buttons
                        ToggleButtons(
                          constraints: BoxConstraints.expand(
                            width: (MediaQuery.of(context).size.width * 0.85 -
                                    45) /
                                2,
                            height: 40,
                          ),
                          isSelected: [isPatient, !isPatient],
                          onPressed: (index) {
                            setState(() {
                              isPatient = index == 0;
                              currentStep = 0;
                            });
                          },
                          color: AppColors.main,
                          selectedColor: Colors.white,
                          fillColor: AppColors.main,
                          borderColor: AppColors.main,
                          selectedBorderColor: AppColors.main,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(0),
                          children: const [
                            Text('Patient'),
                            Text('Doctor'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Multi-step form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              if (isPatient)
                                _buildPatientForm()
                              else
                                _buildDoctorForm(),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width *
                                            0.85 -
                                        42),
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (currentStep < 2) {
                                            setState(() {
                                              currentStep++;
                                            });
                                          } else {
                                            // Handle form submission
                                            print('Form submitted');
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .zero, // Remove border radius
                                        ),
                                        backgroundColor: AppColors.main,
                                      ),
                                      child: Text(
                                        style: const TextStyle(
                                            color: Colors.white),
                                        currentStep == 2 ? 'Sign Up' : 'Next',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientForm() {
    switch (currentStep) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please enter your information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: _patientFullNameController,
              decoration: _inputDecoration('Full Name').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.grey,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your full name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientEmailController,
              decoration: _inputDecoration('Email').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.email), // Email icon on the left
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your email' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientPasswordController,
              decoration: _inputDecoration('Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(
                    Icons.remove_red_eye), // Password lock icon on the left
              ),
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a password' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientConfirmPasswordController,
              decoration: _inputDecoration('Confirm Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(
                    Icons.remove_red_eye), // Password lock icon on the left
              ),
              obscureText: true,
              validator: (value) {
                if (value != _patientPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            TextFormField(
              controller: _patientAgeController,
              decoration: _inputDecoration('Age').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your age' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientCountryController,
              decoration: _inputDecoration('Country').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your country' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientGenderController,
              decoration: _inputDecoration('Gender').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your gender' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientHealthConditionsController,
              decoration:
                  _inputDecoration('Existing Health Conditions').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientAllergiesController,
              decoration: _inputDecoration('Allergies').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              maxLines: 3,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            TextFormField(
              controller: _patientConfirmationCodeController,
              decoration: _inputDecoration('Confirmation Code').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the confirmation code' : null,
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildDoctorForm() {
    switch (currentStep) {
      case 0:
        return Column(
          children: [
            TextFormField(
              controller: _doctorNameController,
              decoration: _inputDecoration('Full Name').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your full name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorEmailController,
              decoration: _inputDecoration('Email').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your email' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorCountryController,
              decoration: _inputDecoration('Country').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your country' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorSpecialityController,
              decoration: _inputDecoration('Speciality').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your speciality' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorYearsOfExpController,
              decoration: _inputDecoration('Years of Experience').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty
                  ? 'Please enter your years of experience'
                  : null,
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle file upload for verification
              },
              child: const Text('Upload Verification Documents'),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            TextFormField(
              controller: _doctorConfirmationCodeController,
              decoration: _inputDecoration('Confirmation Code').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the confirmation code' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorPasswordController,
              decoration: _inputDecoration('Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a password' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorConfirmPasswordController,
              decoration: _inputDecoration('Confirm Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
              ),
              obscureText: true,
              validator: (value) {
                if (value != _doctorPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ],
        );
      default:
        return Container();
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      fillColor: AppColors.white,
      labelText: label,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 146, 147, 147)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.main),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.main),
      ),
    );
  }
}
