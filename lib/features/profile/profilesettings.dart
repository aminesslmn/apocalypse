import 'package:apocalypsea2sv/features/profile/components/accountsecuritysection.dart';
import 'package:apocalypsea2sv/features/profile/components/accountsettingsectiontitle.dart';
import 'package:apocalypsea2sv/features/profile/components/healthinfosection.dart';
import 'package:apocalypsea2sv/features/profile/components/personalinfosection.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profilesettings extends StatefulWidget {
  const Profilesettings({super.key});

  @override
  State<Profilesettings> createState() => _ProfilesettingsState();
}

class _ProfilesettingsState extends State<Profilesettings> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // Access the user's name and email from the AuthProvider
    final String userName = authProvider.userName.isNotEmpty
        ? authProvider.userName
        : "Default Name"; // Replace "Default Name" with a fallback value if needed

    final String userEmail = authProvider.userEmail.isNotEmpty
        ? authProvider.userEmail
        : "default.email@example.com"; // Replace with a fallback value if needed

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
          title: const Text('Account Settings'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AccountSettingSectionTitle("Personal Information"),
                const SizedBox(
                  height: 20,
                ),
                // Use dynamic user name and email
                PersonalInfoSection(
                  fullName: userName,
                  email: userEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                const AccountSettingSectionTitle("Security"),
                const SizedBox(
                  height: 20,
                ),
                const ProfileSecuritySection(
                ),
                const SizedBox(
                  height: 20,
                ),
                const AccountSettingSectionTitle("Health information"),
                const SizedBox(
                  height: 20,
                ),
                const HealthInfoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
