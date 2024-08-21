import 'package:apocalypsea2sv/features/Profile/components/diagnosishistorybox.dart';
import 'package:apocalypsea2sv/features/Profile/components/Profileshow.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Profileshow(),
              SizedBox(height: 20),
              Text(
                "Diagnosis History",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Diagnosishistorybox(),
                      SizedBox(height: 25),
                      Diagnosishistorybox(),
                      SizedBox(height: 25),
                      Diagnosishistorybox(),
                      SizedBox(height: 25),
                      Diagnosishistorybox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
