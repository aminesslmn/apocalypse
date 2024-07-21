import 'package:flutter/material.dart';

class AccountSettingSectionTitle extends StatelessWidget {
  final String title;

  const AccountSettingSectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF8E8E8E),
        fontSize: 17,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    );
  }
}
