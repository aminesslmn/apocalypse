import 'package:apocalypsea2sv/features/doctor/components/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure this is added to your pubspec.yaml

class AccountNotAccepted extends StatefulWidget {
  const AccountNotAccepted({super.key});

  @override
  State<AccountNotAccepted> createState() => _AccountNotAcceptedState();
}

class _AccountNotAcceptedState extends State<AccountNotAccepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Verification'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/attention.svg',
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Document not accepted',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Unfortunately, your document doesn’t meet the requirements to obtain a doctor’s account.\n\n'
                'Please ensure that:\n'
                '• It is an official document that verifies your status as a doctor.\n'
                '• Your specialty is dermatology.\n'
                '• The document is a clear and neat scan.\n'
                'Once you’ve met these requirements, please try uploading again.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload your document here',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Handle document upload action
                      },
                      child: Text('Choose File'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle Log out logic or navigation
                    },
                    child: Text(
                      'Log out',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle account deletion logic here
                    },
                    child: Text(
                      'Delete account',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
