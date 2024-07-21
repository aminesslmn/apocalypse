import 'package:apocalypsea2sv/features/profile/profilesettings.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profileshow extends StatelessWidget {
  const Profileshow({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF00ABB6),
      ),
      height: 140,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 19,

                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1482650271/photo/working-hard-to-hit-a-deadline.jpg?s=612x612&w=0&k=20&c=xwrHxUoVvx7XtQz18aA2qkpnTMSiqIiKlMZkL7AuyFM='), // Use a real image URL
                ),
                SizedBox(width: 10),
                // Name and email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authProvider.user?.displayName ?? "Mohcen Chouireb",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      authProvider.user?.email ?? "raid.ouahioune@ensia.edu.dz",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Settings icon
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profilesettings()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Calendar icon
                Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 12,
                ),
                SizedBox(width: 8),
                // Joined since date
                Text(
                  'Joined since 01 Jan 2023', // Replace with the actual date
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Spacer(),
                // Diagnosis icon
                Icon(
                  Icons
                      .medical_services, // Or use a different icon that represents diagnosis
                  color: Colors.white,
                  size: 12,
                ),
                SizedBox(width: 8),
                // Received diagnoses text
                Text(
                  'Received 30 diagnoses',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
