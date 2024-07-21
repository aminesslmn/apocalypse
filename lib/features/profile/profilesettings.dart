
import 'package:apocalypsea2sv/features/profile/components/accountsecuritysection.dart';
import 'package:apocalypsea2sv/features/profile/components/accountsettingsectiontitle.dart';
import 'package:apocalypsea2sv/features/profile/components/healthinfosection.dart';
import 'package:apocalypsea2sv/features/profile/components/personalinfosection.dart';
import 'package:flutter/material.dart';

class Profilesettings extends StatefulWidget {
  const Profilesettings({super.key});

  @override
  State<Profilesettings> createState() => _ProfilesettingsState();
}

class _ProfilesettingsState extends State<Profilesettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Navigate back to the previous screen
              },
            ),
            title: const Text('Account Settings'),
          ),
          body: SingleChildScrollView(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountSettingSectionTitle("Personal Information"),
                  SizedBox(
                    height: 20,
                  ),
                  PersonalInfoSection(
                    fullName: 'Amy Horsefighter',
                    email: 'ahorsefighter@gmail.com',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AccountSettingSectionTitle("Security"),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileSecuritySection(
                      // Replace with actual value or controller
                      ),
                      SizedBox(
                    height: 20,
                  ),
                  AccountSettingSectionTitle("Health information"),
                  SizedBox(
                    height: 20,
                  ),
                  HealthInfoSection(),
                ],
              ),
            ),
          )),
    );
  }
}
