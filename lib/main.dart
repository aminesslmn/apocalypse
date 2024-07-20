import 'package:apocalypsea2sv/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/feed/views/home_page.dart'; // Assuming your HomePage view is located here
// Assuming your UI colors are defined here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
