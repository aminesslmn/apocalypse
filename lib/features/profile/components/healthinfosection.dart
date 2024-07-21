import 'package:flutter/material.dart';

class HealthInfoSection extends StatefulWidget {
  const HealthInfoSection({Key? key}) : super(key: key);

  @override
  _HealthInfoSectionState createState() => _HealthInfoSectionState();
}

class _HealthInfoSectionState extends State<HealthInfoSection> {
  late TextEditingController _ageController;
  late TextEditingController _genderController;
  late TextEditingController _healthConditionsController;
  late TextEditingController _allergiesController;

  @override
  void initState() {
    super.initState();
    _ageController = TextEditingController();
    _genderController = TextEditingController();
    _healthConditionsController = TextEditingController();
    _allergiesController = TextEditingController();
  }

  @override
  void dispose() {
    _ageController.dispose();
    _genderController.dispose();
    _healthConditionsController.dispose();
    _allergiesController.dispose();
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
          _buildInfoField('Age', _ageController),
          SizedBox(height: 16),
          _buildInfoField('Gender', _genderController),
          SizedBox(height: 16),
          _buildInfoField(
              'Existing Health Conditions', _healthConditionsController),
          SizedBox(height: 16),
          _buildInfoField('Allergies', _allergiesController),
          SizedBox(height: 16),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label, TextEditingController controller) {
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
                Expanded(
                  child: TextField(
                    controller: controller,
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
