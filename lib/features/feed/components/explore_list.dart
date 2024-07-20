import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class ExploreList extends StatelessWidget {
  final List<String> imageAssetPaths;
  final List<String> imageTitles;

  const ExploreList({Key? key, required this.imageAssetPaths, required this.imageTitles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0, // Adjust container height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageAssetPaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack( // Use Stack for overlapping widgets
              children: [
                ClipRRect( // Wrap image with ClipRRect for rounded corners
                  borderRadius: BorderRadius.circular(10.0), // Adjust corner radius
                  child: Image.asset(
                    imageAssetPaths[index],
                    width: 150.0,
                    height: 170.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned( // Text positioned on top with some padding
                  bottom: 8.0, // Adjust positioning as needed
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    color: Colors.transparent, // Transparent background
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      imageTitles[index],
                      style: TextStyle(color: AppColors.dark, fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
