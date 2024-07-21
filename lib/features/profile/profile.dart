
import 'package:apocalypsea2sv/features/profile/components/diagnosishistorybox.dart';
import 'package:apocalypsea2sv/features/profile/components/profileshow.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Ensure the diagnosis history section is scrollable
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
