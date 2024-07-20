import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    height: 100,
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
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: TextStyle(color: AppColors.main),
                            prefixIcon:
                                Icon(Icons.person, color: AppColors.main),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.main),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(246, 0, 170, 182)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: AppColors.main),
                            prefixIcon:
                                Icon(Icons.email, color: AppColors.main),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.main),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.main),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: AppColors.main),
                            prefixIcon: Icon(Icons.lock, color: AppColors.main),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.main),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.main),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: AppColors.main),
                            prefixIcon: Icon(Icons.lock, color: AppColors.main),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.main),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.main),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            // Define your action here
                          },
                          child: const Text(
                            'Already have an account? Log in',
                            style: TextStyle(color: AppColors.main),
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
}
