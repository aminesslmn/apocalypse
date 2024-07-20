import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BalsamScreen extends StatelessWidget {
  const BalsamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        fit:
            StackFit.expand, // This ensures the Stack takes up the whole screen
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/robot.png', // Ensure this matches the path in your pubspec.yaml
              fit:
                  BoxFit.cover, // Changed to cover for full background coverage
            ),
          ),
          // Overlay content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 50), // Add some space at the top
                Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      // Ensure this matches the path in your pubspec.yaml
                      fit: BoxFit.fill, // Ensures it covers the whole width
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                  ],
                ),
                // Wave image at the bottom,

                Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        'assets/wave.png',
                        // Ensure this matches the path in your pubspec.yaml
                        fit: BoxFit.fill, // Ensures it covers the whole width
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Welcome to Balsam!",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(211, 0, 170, 182),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Flexible(
                              child: Text(
                                  overflow: TextOverflow.visible,
                                  "our AI health assistant. Get instant skin analysis and personalized health tips for your overall wellness."),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Define your action here
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                backgroundColor: Colors.teal, // Button color
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
