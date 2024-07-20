import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x4C000000),
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF79747E).withOpacity(0.4),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Take or upload your picture from here:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF4B4B4B),
              fontSize: 17,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFFF8156),
              side: const BorderSide(color: Color(0xFFFFA487)),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Set border radius to zero
              ),
            ),
            icon: const Icon(Icons.upload, size: 24),
            label: const Text(
              'Upload Picture',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () {
              // Handle upload picture action
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFA487),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Set border radius to zero
              ),
            ),
            icon: const Icon(Icons.camera_alt, size: 24, color: Colors.white),
            label: const Text(
              'Take Picture',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () {
              // Handle take picture action
            },
          ),
        ],
      ),
    );
  }
}
