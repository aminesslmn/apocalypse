import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            iconPath: 'assets/icons/home.svg',
            title: 'Home',
            index: 0,
          ),
          _buildNavItem(
            iconPath: 'assets/icons/search.svg',
            title: 'Search',
            index: 1,
          ),
          _buildNavItem(
            iconPath: 'assets/icons/notifications.svg',
            title: 'Notifications',
            index: 2,
          ),
          _buildNavItem(
            iconPath: 'assets/icons/profile.svg',
            title: 'Profile',
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String title,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? Colors.blue : Colors.grey,
            height: 24.0,
            width: 24.0,
          ),
          if (isSelected)
            Text(
              title,
              style: TextStyle(color: Colors.blue, fontSize: 12.0),
            ),
        ],
      ),
    );
  }
}
