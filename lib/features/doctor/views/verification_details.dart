import 'package:apocalypsea2sv/features/doctor/views/patient_feedback.dart';
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 3, //number of items here
        itemBuilder: (context, index) {
          return _buildVerificationItem(context); //build function
        },
      ),
    );
  }

  Widget _buildVerificationItem(BuildContext context) {
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
              '20 July 2024',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 10.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset('assets/skin_disease.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Model response: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Benign Keratosis',
                    style: TextStyle(
                      color: Color(0xFFFF8156),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Accuracy: 63.96%',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
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
                      foregroundColor: Color(0xFF15C5CE),
                      side: BorderSide(color: Color(0xFF15C5CE)),
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
                              builder: (context) => PatientFeedbackPage()));
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
