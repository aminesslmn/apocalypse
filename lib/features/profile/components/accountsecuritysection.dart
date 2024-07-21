import 'package:flutter/material.dart';

class ProfileSecuritySection extends StatefulWidget {
  const ProfileSecuritySection({Key? key}) : super(key: key);

  @override
  _ProfileSecuritySectionState createState() => _ProfileSecuritySectionState();
}

class _ProfileSecuritySectionState extends State<ProfileSecuritySection> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoField('Current Password', _currentPasswordController, Icons.lock),
              SizedBox(height: 16),
              _buildInfoField('New Password', _newPasswordController, Icons.lock),
            ],
          ),
          SizedBox(height: 16),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF4B4B4B),
            fontSize: 17,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xFF8E8E8E)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Icon(icon, size: 18, color: Color(0xFF8E8E8E)),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: controller,
                    obscureText: true, // Hide text for password fields
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: label,
                      hintStyle: TextStyle(
                        color: Color(0xFF8E8E8E),
                        fontSize: 17,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFF15C5CE),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
