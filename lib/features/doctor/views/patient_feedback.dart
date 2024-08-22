import 'package:flutter/material.dart';

class PatientFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Models’ responses to verify'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient Info Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xB0EBEC),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/image1.png'),
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Patient A33',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '33 yo, Algeria, Female',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Existing Health Conditions:',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      Chip(label: Text('Illness 1')),
                      Chip(label: Text('Illness 2 with long name')),
                      Chip(label: Text('Illness 3.000')),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Allergies:',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      Chip(label: Text('Idk')),
                      Chip(label: Text('Idk')),
                      Chip(label: Text('Idk')),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFF2EE),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '20 July 2024 (current one)',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Benign Keratosis\n',
                          style: TextStyle(
                            color: Color(0xFFFF8156),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
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
                            //handle this
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF47CFD6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            side: BorderSide(color: Color(0xFF47CFD6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cancel, color: Color(0xFF47CFD6)),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  'Mark as Wrong',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF47CFD6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle 'Mark as Correct' action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF47CFD6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            side: BorderSide(color: Color(0xFF47CFD6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check, color: Color(0xFF47CFD6)),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  'Mark as Correct',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF47CFD6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Diagnoses History
            const Text(
              'Diagnoses History',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            _buildDiagnosisHistoryItem(context, 'Benign Keratosis',
                '20 July 2024', 'Prescription Hydrogen Peroxide', '63.96%'),
            const SizedBox(height: 10.0),
            _buildDiagnosisHistoryItem(context, 'Benign Keratosis',
                '20 July 2024', 'Prescription Hydrogen Peroxide', '63.96%'),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagnosisHistoryItem(BuildContext context, String title,
      String date, String medicine, String accuracy) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset('assets/skin_disease.png',
                width: 60.0, height: 60.0, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00ABB6)),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Suggested Medicine: $medicine',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Accuracy: $accuracy',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                const SizedBox(height: 4.0),
                Text(
                  date,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
