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
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("Benign Diagnosis"),
                            Spacer(),
                            Text("20 July 2024"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            // Column for text items, aligned to the top-left
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align texts to the left
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Align texts to the top
                              children: [
                                Text("Data 1"),
                                Text("Data 2"),
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
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://via.placeholder.com/150'), // Replace with your image URL
                                  fit: BoxFit
                                      .cover, // How the image should be fitted
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