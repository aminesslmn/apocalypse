import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/feed/views/home_page.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart';
import 'package:apocalypsea2sv/providers/doctor_auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPatient = true;
  int currentStep = 0;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
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

  String? _selectedCountry;
  String? _selectedGender;
  final List<String> _genders = ['Male', 'Female'];
  final List<String> _countries = ['Algeria', 'Ethiopia'];

  String? _validateAge(String? value) {
    final age = int.tryParse(value ?? '');
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    } else if (age == null || age < 0 || age > 120) {
      return 'Please enter a valid age (0-120)';
    }
    return null;
  }

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
                      color: Colors.white.withOpacity(
                          0.9), // Slightly transparent white background
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
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
                          borderRadius:
                              BorderRadius.circular(5), // Add rounded corners
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
                              Text(
                                Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .error ??
                                    '',
                                style: const TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          if (currentStep < 1) {
                                            setState(() {
                                              currentStep++;
                                            });
                                          } else {
                                            // Access the providers
                                            final authProvider =
                                                Provider.of<AuthProvider>(
                                                    context,
                                                    listen: false);
                                            final doctorAuthProvider =
                                                Provider.of<DoctorAuthProvider>(
                                                    context,
                                                    listen: false);

                                            // Extract values from controllers
                                            final email = isPatient
                                                ? _patientEmailController.text
                                                : _doctorEmailController.text;
                                            final password = isPatient
                                                ? _patientPasswordController
                                                    .text
                                                : _doctorPasswordController
                                                    .text;

                                            if (isPatient) {
                                              //temporary
                                              final authProvider =
                                                  Provider.of<AuthProvider>(
                                                      context,
                                                      listen: false);
                                              await authProvider.login();
                                              // temporary as well
                                              await authProvider
                                                  .saveUserToPreferences(
                                                      email: email,
                                                      fullName:
                                                          _patientFullNameController
                                                              .text);
                                              //for debuggiiiiiiiing

                                              // For patients
                                              await authProvider
                                                  .createUserWithEmailAndPassword(
                                                      email, password);
                                            } else {
                                              // For doctors
                                              await doctorAuthProvider
                                                  .registerDoctor(
                                                      email, password, {
                                                'name':
                                                    _doctorNameController.text,
                                                'country':
                                                    _doctorCountryController
                                                        .text,
                                                'speciality':
                                                    _doctorSpecialityController
                                                        .text,
                                                'yearsOfExp':
                                                    _doctorYearsOfExpController
                                                        .text,
                                              });
                                            }

                                            print(
                                                'Error: ${authProvider.error}');

                                            if (authProvider.error == null) {
                                              // Navigate to the home page

                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage(),
                                                ),
                                              );
                                              _addPatientData();
                                              print('Form submitted');
                                            }
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8), // Rounded button
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientPasswordController,
              obscureText: !_isPasswordVisible,
              decoration: _inputDecoration('Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.lock), // Lock icon on the left
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your password' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientConfirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: _inputDecoration('Confirm Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.lock), // Lock icon on the left
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please enter your age, gender, country, health conditions, and allergies",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: _patientAgeController,
              decoration: _inputDecoration('Age').copyWith(
                fillColor: Colors.white,
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.cake),
              ),
              keyboardType: TextInputType.number,
              validator: _validateAge,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              hint: const Text('Select Country'),
              decoration: _inputDecoration('Country').copyWith(
                fillColor: Colors.white,
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.public),
              ),
              items: _countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value;
                });
              },
              validator: (value) =>
                  value == null ? 'Please select your country' : null,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              hint: const Text('Select Gender'),
              decoration: _inputDecoration('Gender').copyWith(
                fillColor: Colors.white,
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.people),
              ),
              items: _genders.map((gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              validator: (value) =>
                  value == null ? 'Please select your gender' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientHealthConditionsController,
              decoration: _inputDecoration('Health Conditions').copyWith(
                fillColor: Colors.white,
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.healing),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your health conditions' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _patientAllergiesController,
              decoration: _inputDecoration('Allergies').copyWith(
                fillColor: Colors.white,
                filled: true,
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.bug_report),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your allergies' : null,
            ),
          ],
        );

      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please enter your confirmation code",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: _patientConfirmationCodeController,
              decoration: _inputDecoration('Confirmation Code').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon:
                    const Icon(Icons.verified), // Verified icon on the left
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your confirmation code' : null,
            ),
          ],
        );

      default:
        return Container(); // Default case for form steps
    }
  }

  Widget _buildDoctorForm() {
    switch (currentStep) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please enter your information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: _doctorNameController,
              decoration: _inputDecoration('Full Name').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.person), // Person icon on the left
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your full name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorEmailController,
              decoration: _inputDecoration('Email').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.email), // Email icon on the left
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorPasswordController,
              obscureText: !_isPasswordVisible,
              decoration: _inputDecoration('Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.lock), // Lock icon on the left
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your password' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorConfirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: _inputDecoration('Confirm Password').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.lock), // Lock icon on the left
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _doctorPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ],
        );

      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please enter your country, speciality, and years of experience",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: _doctorCountryController,
              decoration: _inputDecoration('Country').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(Icons.public), // Public icon on the left
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your country' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorSpecialityController,
              decoration: _inputDecoration('Speciality').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon: const Icon(
                    Icons.local_hospital), // Hospital icon on the left
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your speciality' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _doctorYearsOfExpController,
              decoration: _inputDecoration('Years of Experience').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon:
                    const Icon(Icons.timeline), // Timeline icon on the left
              ),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty
                  ? 'Please enter your years of experience'
                  : null,
            ),
          ],
        );

      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please enter your confirmation code",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: _doctorConfirmationCodeController,
              decoration: _inputDecoration('Confirmation Code').copyWith(
                fillColor: Colors.white, // Set the background color to white
                filled: true, // Enable the fill color
                prefixIconColor: Colors.grey,
                prefixIcon:
                    const Icon(Icons.verified), // Verified icon on the left
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your confirmation code' : null,
            ),
          ],
        );

      default:
        return Container(); // Default case for form steps
    }
  }

// Define the Firestore collection references
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//final CollectionReference _patientsCollection = _firestore.collection('users');
//final CollectionReference _doctorsCollection = _firestore.collection('doctors');

// Save patient data to Firestore
// Example function to add patient data
  Future<void> _addPatientData() async {
    try {
      await _firestore.collection('users').add({
        'fullName': _patientFullNameController.text,
        'email': _patientEmailController.text,
        // Add other fields as needed
      });
    } catch (e) {
      print('Error adding patient data: $e');
    }
  }

// Save doctor data to Firestore
// Future<void> _saveDoctorData() async {
//   try {
//     await _doctorsCollection.add({
//       'name': _doctorNameController.text,
//       'email': _doctorEmailController.text,
//       'country': _doctorCountryController.text,
//       'speciality': _doctorSpecialityController.text,
//       'yearsOfExperience': _doctorYearsOfExpController.text,
//       'confirmationCode': _doctorConfirmationCodeController.text,
//     });
//     print('Doctor data saved successfully');
//   } catch (e) {
//     print('Error saving doctor data: $e');
//   }
// }

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.grey), // Border color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide:
            const BorderSide(color: Colors.blue), // Focused border color
      ),
    );
  }
}
