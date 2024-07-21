import 'package:apocalypsea2sv/features/detection/pages/start_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apocalypsea2sv/features/Diagnosis/views/tips_pages_wrapper.dart';
import 'package:apocalypsea2sv/features/feed/views/home_page.dart';
import 'package:apocalypsea2sv/features/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
    HomeContentPage(), // Page 0
    StartDiagnosisPage(), // Page 1
    DailyTipsPage(), // Page 2
    ProfilePage(), // Page 3
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_screenNames.length, (index) {
            final bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Row(
                  children: [
                    AnimatedScale(
                      scale: isSelected ? 1.2 : 1.0,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: SvgPicture.asset(
                        _getIconPath(index),
                        color: isSelected ? Colors.teal : Colors.grey,
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                    if (isSelected)
                      AnimatedSlide(
                        offset: isSelected ? Offset(0, 0) : Offset(1, 0),
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _screenNames[index],
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return 'assets/icons/home.svg';
      case 1:
        return 'assets/icons/camera.svg';
      case 2:
        return 'assets/icons/health.svg';
      case 3:
        return 'assets/icons/profile.svg';
      default:
        return 'assets/icons/home.svg';
    }
  }
}
