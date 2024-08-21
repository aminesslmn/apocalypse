import 'package:flutter/material.dart';

class AccountPending extends StatefulWidget {
  const AccountPending({super.key});

  @override
  State<AccountPending> createState() => _AccountPendingState();
}

class _AccountPendingState extends State<AccountPending> {
  void _showLearnMoreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Learn More'),
        content: Text(
          'Here you can provide more detailed information about the verification process, such as expected timelines, FAQs, or contact details for support.',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

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
              Container(
                width: double.infinity,
                height: 4,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 16),
              Text(
                'We are currently verifying your account. This process may take a few minutes. You will be notified once the verification is complete.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: _showLearnMoreDialog,
                child: Text(
                  'Learn more',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
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
