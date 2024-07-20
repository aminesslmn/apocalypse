import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class TopNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const TopNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  _TopNavBarState createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTab(0, "Daily Tips"),
        _buildTab(1, "More Tips"),
        _buildTab(2, "Symptoms Diagnosis"),
      ],
    );
  }

  Widget _buildTab(int index, String text) {
    final isSelected = widget.selectedIndex == index;
    final color = isSelected ? AppColors.iconColor3 : Colors.grey;
    
    return GestureDetector(
      onTap: () => widget.onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4.0),
              height: 3.0,
              width: 60.0,
              color: color,
            ),
        ],
      ),
    );
  }
}
