import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String headerText;

  const Header({Key? key, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Text(
          headerText,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: AppColors.dark,
          ),
        ),
      ),
    );
  }
}
