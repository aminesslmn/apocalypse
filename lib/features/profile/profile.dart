import 'package:apocalypsea2sv/features/Profile/components/diagnosishistorybox.dart';
import 'package:apocalypsea2sv/features/Profile/components/Profileshow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<Map<String, dynamic>>> _diagnosisHistory;

  @override
  void initState() {
    super.initState();
    _diagnosisHistory = _fetchDiagnosisHistory();
  }

  Future<List<Map<String, dynamic>>> _fetchDiagnosisHistory() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return [];
    }

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('diagnoses')
        .where('userId', isEqualTo: user.uid)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  String formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Profileshow(),
              const SizedBox(height: 20),
              const Text(
                "Diagnosis History",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _diagnosisHistory,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                              'Error loading data ${snapshot.error.toString()}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No diagnosis history found'));
                    }

                    List<Map<String, dynamic>> history = snapshot.data!;

                    return SingleChildScrollView(
                      child: Column(
                        children: history.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Diagnosishistorybox(
                              disease: entry["disease"],
                              imageUrl: entry["imageUrl"],
                              medicine: "Not Mentioned", // temporary
                              date: formatTimestamp(entry["timestamp"]),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
