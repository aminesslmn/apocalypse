import 'package:apocalypsea2sv/features/Diagnosis/views/tips_pages_wrapper.dart';
import 'package:apocalypsea2sv/features/detection/pages/start_diagnosis.dart';
import 'package:apocalypsea2sv/features/doctor/components/doctor_nav_bar.dart';
import 'package:apocalypsea2sv/features/doctor/components/model_response_item.dart';
import 'package:apocalypsea2sv/features/doctor/components/patient_request_item.dart';
import 'package:apocalypsea2sv/features/doctor/views/verification_details.dart';
import 'package:apocalypsea2sv/features/feed/components/navbar.dart';
import 'package:apocalypsea2sv/features/feed/components/user_profile.dart';
import 'package:apocalypsea2sv/features/profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeVerified extends StatelessWidget {
  const HomeVerified({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomNavBar(
      screens: [
        // Replace this with other screens if needed
        HomeVerifiedPageContent(),
        VerificationDetailPage(),
        DailyTipsPage(),
        ProfilePage(),
      ],
    );
  }
}

class HomeVerifiedPageContent extends StatefulWidget {
  const HomeVerifiedPageContent({Key? key}) : super(key: key);

  @override
  State<HomeVerifiedPageContent> createState() =>
      _HomeVerifiedPageContentState();
}

class _HomeVerifiedPageContentState extends State<HomeVerifiedPageContent> {
  late Future<List<Map<String, dynamic>>> _diagnosisHistory;

  @override
  void initState() {
    super.initState();
    // _diagnosisHistory = _fetchDiagnosisHistory();
  }

  Future<List<Object>> _fetchDiagnosisHistory() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return [];
    }

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('diagnoses')
          .where('verified', isEqualTo: false)
          .orderBy('timestamp', descending: true)
          .get();

      return snapshot.docs;
    } catch (e) {
      print(e.toString());

      return [];
    }
  }

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
              const UserProfile(
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
              border: Border.all(
                color: Colors.green,
                width: 2.0,
              ), // Green border
            ),
            child: const Icon(
              size: 15,
              Icons.check,
              color: Colors.green, // Green icon color
            ),
          ),
          const SizedBox(width: 8.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: ModelResponseItem(),
        child: Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('diagnoses')
                .where('verified', isEqualTo: false)
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                        'Error loading data ${snapshot.error.toString()}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No Diagnosis to Verify'));
              }

              final docs = snapshot.data!.docs;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  final docId = doc.id; // This is the document ID
                  final data = doc.data() as Map<String, dynamic>;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ModelResponseItem(
                      disease: data['disease'],
                      imageUrl: data['imageUrl'],
                      accuracy: data['accuracy'] ?? "0.94",
                      date: data['timestamp'],
                      documentId: docId,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPatientRequestsList() {
    return SizedBox(
      height: 185.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: PatientRequestItem(),
          ); // Pass the context here
        },
      ),
    );
  }

  Widget _buildSeeMoreButton() {
    return TextButton(
      onPressed: () {
        // Handle see more action
      },
      child: const Text(
        'See more',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
