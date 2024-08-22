import 'package:flutter/material.dart';

class PatientRequestItem extends StatelessWidget {
  const PatientRequestItem({super.key});

  @override
  Widget build(BuildContext context) {
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
}
