import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  // Login form
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
                          "Welcome Back!",
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Please log in to your account.",
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.withOpacity(0.1),
                              labelText: "Email",
                              labelStyle:
                                  const TextStyle(color: AppColors.main),
                              prefixIcon: const Icon(Icons.email,
                                  color: AppColors.main),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.green.withOpacity(0.1),
                              labelText: "Password",
                              labelStyle:
                                  const TextStyle(color: AppColors.main),
                              prefixIcon:
                                  const Icon(Icons.lock, color: AppColors.main),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.main),
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
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
                            'Login',
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
                              'Don\'t have an account? Sign up',
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
