import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Diagnosishistorybox extends StatelessWidget {
  String date;
  String disease;
  String medicine;
  String imageUrl;

  Diagnosishistorybox({
    super.key,
    required this.date,
    required this.disease,
    required this.medicine,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFEEEEEE),
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
            Row(
              children: [
                const Text("Benign Diagnosis"),
                const Spacer(),
                Text(date),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // Column for text items, aligned to the top-left
                ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: 200.0), // Set a maximum width
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align texts to the left
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Align texts to the top
                    children: [
                      Text(
                        "Disease is $disease",
                        maxLines: null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Probable Medicine is: "),
                      Text(medicine)
                    ],
                  ),
                ),
                const Spacer(), // Pushes the image to the right
                // Container for the image with border radius and smaller size
                Container(
                  width: 100, // Smaller width for the image
                  height: 100, // Smaller height for the image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12), // Border radius for rounded corners
                    image: DecorationImage(
                      image: NetworkImage(
                        imageUrl,
                      ), // Replace with your image URL
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
