import 'package:apocalypsea2sv/config/ui_colors.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String userName;
  final String userEmail;

  const UserProfile({
    Key? key,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0), // Set desired corner radius
        color: Color(0xFFF5F5F5), // Set background color,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(''), // Replace with user image URL
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0), // Add left padding
                child: Text(
                  userName,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(userEmail),
                ),              
            ],
          )
        ],
      ),
    );
  }
}
