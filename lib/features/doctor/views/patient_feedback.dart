import 'package:apocalypsea2sv/config/func.dart';
import 'package:apocalypsea2sv/features/doctor/components/diagnosis_history_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientFeedbackPage extends StatelessWidget {
  String patientName;
  String age;
  String gender;
  List<String> healthConditions;
  List<String> allergies;
  Timestamp date;
  String disease;
  String accuracy;

  PatientFeedbackPage({
    super.key,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.healthConditions,
    required this.allergies,
    required this.date,
    required this.disease,
    required this.accuracy,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Models’ responses to verify"),
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
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/image1.png'),
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            patientName,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$age yo, Algeria, $gender',
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
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
                    children: healthConditions.map((illness) {
                      return Chip(label: Text(illness));
                    }).toList(),
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
                    children: allergies.map((allergy) {
                      return Chip(label: Text(allergy));
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2EE),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${formatTimestamp(date)} (current one)',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$disease \n',
                          style: const TextStyle(
                            color: Color(0xFFFF8156),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
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
                            _showDiagnosisDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF47CFD6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            side: const BorderSide(color: Color(0xFF47CFD6)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cancel, color: Color(0xFF47CFD6)),
                              SizedBox(width: 8.0),
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
                            _showConfirmDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF47CFD6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            side: const BorderSide(color: Color(0xFF47CFD6)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check, color: Color(0xFF47CFD6)),
                              SizedBox(width: 8.0),
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
            DiagnosisHistoryItem(
              title: 'Benign Keratosis',
              date: '20 July 2024',
              medicine: 'Prescription Hydrogen Peroxide',
              accuracy: '63.96%',
            ),
            const SizedBox(height: 10.0),
            DiagnosisHistoryItem(
              title: 'Benign Keratosis',
              date: '20 July 2024',
              medicine: 'Prescription Hydrogen Peroxide',
              accuracy: '63.96%',
            ),
          ],
        ),
      ),
    );
  }

  void _showDiagnosisDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Text('Please Diagnose this state'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                hint: const Text('Choose the disease'),
                items: <String>[
                  'Diagnosis 1',
                  'Diagnosis 2',
                  'Diagnosis 3',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // handle the value
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'If it is a different disease, please enter the name of the disease',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Disease name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Brief description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); //just popping for now
                      _showConfirmDialog(context);
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Color(0xFF47CFD6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/skin_disease.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Benign Keratosis',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFFFF8156),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Accuracy: 63.96%',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF47CFD6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: const BorderSide(color: Color(0xFF47CFD6)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.cancel, color: Color(0xFF47CFD6)),
                        SizedBox(width: 8.0),
                        Text(
                          'Mark as Wrong',
                          style: TextStyle(color: Color(0xFF47CFD6)),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF47CFD6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: const BorderSide(color: Color(0xFF47CFD6)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.check, color: Color(0xFF47CFD6)),
                        SizedBox(width: 8.0),
                        Text(
                          'Mark as Correct',
                          style: TextStyle(color: Color(0xFF47CFD6)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); //pops for now, handle later
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Color(0xFF47CFD6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
