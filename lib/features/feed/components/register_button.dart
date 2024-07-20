import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart' as auth_provider;

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.authProvider,
    required TextEditingController ageController,
    required TextEditingController genderController,
    required this.selectedHealthCondition,
    required this.selectedAllergy,
  })  : _formKey = formKey,
        _ageController = ageController,
        _genderController = genderController;

  final GlobalKey<FormState> _formKey;
  final auth_provider.AuthProvider authProvider;
  final TextEditingController _ageController;
  final TextEditingController _genderController;
  final String selectedHealthCondition;
  final String selectedAllergy;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          await authProvider.createUserWithEmailAndPassword(
            authProvider.email!,
            authProvider.password!, // replace with your actual password
          );

          if (authProvider.error == null) {
            // Navigate to the next screen
            Navigator.pushNamed(context, '/home');
          }
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        backgroundColor: AppColors.main,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
