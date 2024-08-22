import 'package:apocalypsea2sv/features/Diagnosis/views/tips_pages_wrapper.dart';
import 'package:apocalypsea2sv/features/detection/pages/start_diagnosis.dart';
import 'package:apocalypsea2sv/features/doctor/components/doctor_nav_bar.dart';
import 'package:apocalypsea2sv/features/doctor/views/verification_details.dart';
import 'package:apocalypsea2sv/features/feed/components/navbar.dart';
import 'package:apocalypsea2sv/features/feed/components/user_profile.dart';
import 'package:apocalypsea2sv/features/profile/profile.dart';
import 'package:flutter/material.dart';

class HomeVerified extends StatelessWidget {
  const HomeVerified({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
      screens: [
        // Replace this with other screens if needed
        const HomeVerifiedPageContent(),
        const VerificationDetailPage(),
        const DailyTipsPage(),
        ProfilePage(),
      ],
    );
  }
}

class HomeVerifiedPageContent extends StatelessWidget {
  const HomeVerifiedPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVerificationStatus(),
              const SizedBox(height: 20.0),
              UserProfile(
                userName: "Mohcen Chouireb",
                userEmail: "mohcen.chouireb@ensia.edu.dz",
                userImagePath: "assets/image1.png",
              ),
              const SizedBox(height: 20.0),
              _buildSectionTitle('Models’ responses to verify'),
              _buildModelResponseList(),
              const SizedBox(height: 10.0),
              _buildSeeMoreButton(),
              const SizedBox(height: 20.0),
              _buildSectionTitle('Requests from Patients'),
              _buildPatientRequestsList(),
              const SizedBox(height: 10.0),
              _buildSeeMoreButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey, width: 0.2), // Grey border
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border:
                  Border.all(color: Colors.green, width: 2.0), // Green border
            ),
            child: Icon(
              size: 15,
              Icons.check,
              color: Colors.green, // Green icon color
            ),
          ),
          const SizedBox(width: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your account has been verified',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildModelResponseList() {
    return SizedBox(
      height: 280.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Replace with your actual data count
        itemBuilder: (context, index) {
          return _buildModelResponseItem(context); // Pass the context here
        },
      ),
    );
  }

  Widget _buildModelResponseItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5, // Adaptive width
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFF2EE),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Minimize height to prevent overflow
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center content horizontally
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '20 July 2024', // Replace with your date data
              style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              textAlign: TextAlign.center, // Center-align the date
            ),
          ),
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('assets/skin_disease.png', fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize height of Column
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center-align text
              children: [
                Text(
                  'Benign Keratosis',
                  textAlign: TextAlign.center, // Center-align text
                  style: const TextStyle(
                    color: Color(0xFFFF8156),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Accuracy: 63.96%',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center-align buttons
                  children: [
                    IconButton(
                      icon: Icon(Icons.clear, color: Colors.red),
                      onPressed: () {
                        //to be handled
                      },
                    ),
                    const SizedBox(width: 16.0), // Add spacing between buttons
                    IconButton(
                      icon: Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        //to be handled
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientRequestsList() {
    return SizedBox(
      height: 160.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildPatientRequestItem(context); // Pass the context here
        },
      ),
    );
  }

  Widget _buildPatientRequestItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.7, // Adaptive width using mediaquery
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFF2EE),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Minimize height to prevent overflow
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the start
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage('assets/image1.png'),
              ),
              const SizedBox(width: 8.0),
              const Text(
                'Amine Salamani',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            '13:50, 20 July 2024', // Replace with your date and time data
            style: const TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
          const SizedBox(height: 4.0),
          const Text(
            'State: urgent',
            style: TextStyle(fontSize: 12.0, color: Colors.red),
          ),
          const SizedBox(height: 4.0),
          const Text(
            'Request to make diagnosis.',
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // Handle deny action
                },
                child: const Text('Deny', style: TextStyle(color: Colors.red)),
              ),
              TextButton(
                onPressed: () {
                  // Handle accept action
                },
                child:
                    const Text('Accept', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSeeMoreButton() {
    return TextButton(
      onPressed: () {
        // Handle see more action
      },
      child: const Text('See more', style: TextStyle(color: Colors.blue)),
    );
  }
}
