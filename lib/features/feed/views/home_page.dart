import 'package:apocalypsea2sv/features/Diagnosis/views/archive_page.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/more_tips.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/tips_pages_wrapper.dart';
import 'package:apocalypsea2sv/features/detection/pages/start_diagnosis.dart';
import 'package:apocalypsea2sv/features/feed/components/user_profile.dart';
import 'package:apocalypsea2sv/features/profile/profile.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:apocalypsea2sv/features/feed/components/explore_list.dart';
import 'package:apocalypsea2sv/features/feed/components/health_tip.dart';
import 'package:apocalypsea2sv/features/feed/components/more_features.dart';
import 'package:apocalypsea2sv/features/feed/components/navbar.dart';
import 'package:apocalypsea2sv/features/feed/components/header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> _screenNames = [
    'Home',
    'Diagnosis',
    'Tips',
    'Profile',
  ];

  final List<Widget> _screens = [
    HomeContentPage(), // Page 0
    StartDiagnosisPage(), // Page 1
    const DailyTipsPage(), // Page 2
    const ProfilePage(), // Page 3
  ];

  void _onItemTapped(int index) {
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
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        screens: _screens,
        initialIndex: _selectedIndex,
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AuthProvider to get patient's info
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return FutureBuilder<void>(
      future: authProvider.loadUserFromPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print("error loading user data");
          return Center(child: Text('Error loading user data'));
        } else {
          // After the Future completes, use the loaded data
          final String userName = authProvider.userName;
          final String userEmail = authProvider.userEmail;

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
              'route': StartDiagnosisPage(),
            },
            {
              'svgPath': "assets/icons/archive.svg",
              'title': 'Diagnoses History',
              'backgroundColor': AppColors.secondaryColor2,
              'iconColor': AppColors.iconColor2,
              'route': ArchivePage(),
            },
            {
              'svgPath': "assets/icons/lamp-charge.svg",
              'title': 'More Health Tips',
              'backgroundColor': AppColors.secondaryColor3,
              'iconColor': AppColors.iconColor3,
              'route': DailyTipsPage(),
            },
          ];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0),
              child: Column(
                children: [
                  const Header(headerText: "Welcome!"),
                  UserProfile(
                    userName: userName,
                    userEmail: userEmail,
                  ),
                  const SizedBox(height: 12.0),
                  const HealthTip(
                    color: AppColors.secondaryColor3,
                    dailyTip:
                        "For strong bones: Include calcium-rich foods like dairy products, leafy greens, and tofu in your diet. Consider taking a vitamin D supplement if needed.",
                  ),
                  const SizedBox(height: 12.0),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5.0),
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
                  const SizedBox(height: 5.0),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "More Features",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: moreFeaturesData.length,
                          itemBuilder: (context, index) {
                            final itemData = moreFeaturesData[index];
                            return GestureDetector(
                              onTap: () {
                                if (itemData['route'] != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => itemData['route'],
                                    ),
                                  );
                                }
                              },
                              child: MoreFeatures(
                                svgAssetPath: itemData['svgPath'] as String?,
                                title: itemData['title'] as String,
                                backgroundColor: itemData['backgroundColor'] as Color,
                                iconColor: itemData['iconColor'] as Color,
                              ),
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
      },
    );
  }
}
