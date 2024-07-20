import 'package:flutter/material.dart';

class ExploreList extends StatelessWidget {
  final List<String> imageAssetPaths; // List of asset paths for local images
  final List<String> imageTitles;

  const ExploreList({Key? key, required this.imageAssetPaths, required this.imageTitles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0, // Adjust container height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageAssetPaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Image.asset(
                  imageAssetPaths[index], // Use AssetImage for local images
                  width: 150.0, // Adjust image width as needed
                  height: 150.0, // Adjust image height as needed
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5.0), // Spacing between image and title
                Text(
                  imageTitles[index],
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
