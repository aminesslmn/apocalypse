import 'package:flutter/material.dart';

class Diagnosishistorybox extends StatefulWidget {
  const Diagnosishistorybox({super.key});

  @override
  State<Diagnosishistorybox> createState() => _DiagnosishistoryboxState();
}

class _DiagnosishistoryboxState extends State<Diagnosishistorybox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFEEEEEE),
      ),
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text("Benign Diagnosis"),
                Spacer(),
                Text("20 July 2024"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // Column for text items, aligned to the top-left
                const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align texts to the left
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align texts to the top
                  children: [
                    Text("Disease is Benign Kurtosis"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Probable Medicine is: "),
                    Text("Prescription Hydrogen Peroxide")
                  ],
                ),
                Spacer(), // Pushes the image to the right
                // Container for the image with border radius and smaller size
                Container(
                  width: 100, // Smaller width for the image
                  height: 100, // Smaller height for the image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12), // Border radius for rounded corners
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.health.com/thmb/8mYiMYhvNgKi6gezwrsPXa2r6XM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-177384156_0-2000-7d742889400d4f0ba5233f297f2a31d2.jpg"), // Replace with your image URL
                      fit: BoxFit.cover, // How the image should be fitted
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
