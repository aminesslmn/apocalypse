import 'package:apocalypsea2sv/config/func.dart';
import 'package:apocalypsea2sv/features/doctor/views/patient_feedback.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VerificationDetailPage extends StatelessWidget {
  const VerificationDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                scrollDirection: Axis.vertical,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  final docId = doc.id;
                  final data = doc.data() as Map<String, dynamic>;

                  // Fetch user information based on userId
                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(data['userId'])
                        .get(),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (userSnapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error loading user data ${userSnapshot.error.toString()}'));
                      } else if (!userSnapshot.hasData) {
                        return const Center(child: Text('User not found'));
                      }

                      final userData =
                          userSnapshot.data!.data() as Map<String, dynamic>;

                      print("user Data ${userData.toString()}");

                      // Use both diagnosis and user data in your UI
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildVerificationItem(
                          context,
                          data['imageUrl'],
                          data['disease'],
                          data['accuracy'] ?? "0.94",
                          data['timestamp'],
                          docId,
                          userData, // Pass the user data to your verification item
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationItem(
    BuildContext context,
    String imageUrl,
    String disease,
    String accuracy,
    Timestamp date,
    String documentId,
    Map<String, dynamic> userData,
  ) {
    return GestureDetector(
      onTap: () {
        // to be handled
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFF2EE),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatTimestamp(date),
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 10.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Model response: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: disease,
                    style: const TextStyle(
                      color: Color(0xFFFF8156),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Accuracy: $accuracy',
              style: const TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // to be handled
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF15C5CE),
                      side: const BorderSide(color: Color(0xFF15C5CE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text("Check Patient's Info"),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientFeedbackPage(
                                    patientName: userData["fullName"],
                                    age: userData["age"],
                                    gender: userData["gender"],
                                    healthConditions:
                                        [userData["healthCondition"]] ?? [],
                                    allergies: [userData["allergy"]] ?? [],
                                    date: date,
                                    disease: disease,
                                    accuracy: accuracy,
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF15C5CE),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Give Feedback'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
