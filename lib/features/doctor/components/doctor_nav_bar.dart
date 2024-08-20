import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorNavBar extends StatefulWidget {
  final List<Widget> screens;
  final int initialIndex;

  const DoctorNavBar({
    Key? key,
    required this.screens,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<DoctorNavBar> createState() => _DoctorNavBarState();
}

class _DoctorNavBarState extends State<DoctorNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

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
        children: widget.screens,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.screens.length, (index) {
            final bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Row(
                  children: [
                    AnimatedScale(
                      scale: isSelected ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 200),
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
                        offset: isSelected ? Offset.zero : const Offset(1, 0),
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _getScreenName(index),
                            style: const TextStyle(
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
    // Update this with the correct icons
    switch (index) {
      case 0:
        return 'assets/icons/home.svg';
      case 1:
        return 'assets/icons/tick-circle.svg';
      case 2:
        return 'assets/icons/profile-2user.svg';
      case 3:
        return 'assets/icons/profile.svg';
      default:
        return 'assets/icons/home.svg';
    }
  }

  String _getScreenName(int index) {
    // Add the screen names here or pass them as a parameter if needed
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Diagnosis';
      case 2:
        return 'Tips';
      case 3:
        return 'Profile';
      default:
        return 'Home';
    }
  }
}
