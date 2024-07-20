// navbar.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  final List<String> screenNames;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
    required this.screenNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          final bool isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () => onItemTapped(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 00),
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
                          screenNames[index],
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
