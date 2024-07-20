import 'package:flutter/material.dart';
import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/feed/components/explore_list.dart';
import 'package:apocalypsea2sv/features/feed/components/health_tip.dart';
import 'package:apocalypsea2sv/features/feed/components/more_features.dart';
import 'package:apocalypsea2sv/features/feed/components/navbar.dart';
import 'package:apocalypsea2sv/features/feed/components/header.dart';
import 'package:apocalypsea2sv/features/feed/components/profile.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/daily_tips.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of screen names corresponding to each index
  final List<String> _screenNames = [
    'Home',
    'Diagnosis',
    'Tips',
    'Profile',
  ];

  // List of pages to navigate
  final List<Widget> _screens = [
    HomeContentPage(),   // Page 0
    // Page 1
    DailyTipsPage(),     // Page 2
    // Page 3
  ];

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenNames[_selectedIndex]),
      ),
      body: _screens[_selectedIndex], // Display the current page
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace these with actual asset paths in your project's assets folder
    final List<String> imageAssetPaths = [
      'assets/image1.png',
      'assets/image2.png',
    ];

    final List<String> imageTitles = [
      'Know more about your Skin disease',
      'Get advice for your health',
    ];

    final List<Map<String, dynamic>> moreFeaturesData = [
      {
        'svgPath': "assets/icons/camera.svg",
        'title': 'Check Skin Health',
        'backgroundColor': AppColors.secondaryColor1,
        'iconColor': AppColors.iconColor1,
      },
      {
        'svgPath': "assets/icons/archive.svg",
        'title': 'Diagnoses History',
        'backgroundColor': AppColors.secondaryColor2,
        'iconColor': AppColors.iconColor2,
      },
      {
        'svgPath': "assets/icons/lamp-charge.svg",
        'title': 'More Health Tips',
        'backgroundColor': AppColors.secondaryColor3,
        'iconColor': AppColors.iconColor3,
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0), // Adjust padding
        child: Column(
          children: [
            Header(headerText: "Welcome!"),
            UserProfile(
              userName: 'Mohcen Chouireb',
              userEmail: 'raid.ouahioune@ensia.edu.dz',
            ),
            SizedBox(height: 12.0),
            HealthTip(
              color: AppColors.secondaryColor3,
              dailyTip:
                  "For strong bones: Include calcium-rich foods like dairy products, leafy greens, and tofu in your diet. Consider taking a vitamin D supplement if needed.",
            ),
            SizedBox(height: 12.0),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0), // Adjust padding
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ExploreList(
                  imageAssetPaths: imageAssetPaths,
                  imageTitles: imageTitles,
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0), // Adjust padding
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "More Features",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 100.0, // Adjust container height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: moreFeaturesData.length,
                    itemBuilder: (context, index) {
                      final itemData = moreFeaturesData[index];
                      return MoreFeatures(
                        svgAssetPath: itemData['svgPath'] as String?,
                        title: itemData['title'] as String,
                        backgroundColor: itemData['backgroundColor'] as Color,
                        iconColor: itemData['iconColor'] as Color,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
