import 'package:flutter/material.dart';
import 'features/feed/views/home_page.dart'; // Assuming your HomePage view is located here
import 'config/ui_colors.dart'; // Assuming your UI colors are defined here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Set the home property to HomePage
      home: HomePage(),
    );
  }
}
