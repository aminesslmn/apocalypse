import 'package:apocalypsea2sv/config/func.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ModelResponseItem extends StatefulWidget {
  final String imageUrl;
  final String disease;
  final String accuracy;
  final Timestamp date;
  final String documentId;

  const ModelResponseItem({
    super.key,
    required this.imageUrl,
    required this.disease,
    required this.accuracy,
    required this.date,
    required this.documentId,
  });

  @override
  _ModelResponseItemState createState() => _ModelResponseItemState();
}

class _ModelResponseItemState extends State<ModelResponseItem> {
  final bool _isButtonDisabled = false;

  void _updateValidationStatus(BuildContext context, bool isValid) async {
    // setState(() {
    //   _isButtonDisabled = true;
    // });

    try {
      await FirebaseFirestore.instance
          .collection('diagnoses')
          .doc(widget.documentId)
          .update({'validation_result': isValid, 'verified': true});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isValid ? 'Validation approved!' : 'Validation rejected!',
          ),
          backgroundColor: isValid ? Colors.green : Colors.red,
        ),
      );
    } catch (e) {
      print('Failed to update validation status: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update validation status'),
          backgroundColor: Colors.red,
        ),
      );

      // setState(() {
      //   _isButtonDisabled = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5, // Adaptive width
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2EE),
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
            CrossAxisAlignment.center, // Center content horizontally
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              formatTimestamp(widget.date), // Replace with your date data
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center, // Center-align the date
            ),
          ),
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 130,
                width: 130,
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize height of Column
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center-align text
              children: [
                Text(
                  widget.disease,
                  textAlign: TextAlign.center, // Center-align text
                  style: const TextStyle(
                    color: Color(0xFFFF8156),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.accuracy,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center-align buttons
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: _isButtonDisabled
                            ? Colors.red // Dimmed red color
                            : Colors.red,
                      ),
                      onPressed: _isButtonDisabled
                          ? null // Disable button when state is true
                          : () {
                              _updateValidationStatus(context, false);
                            },
                    ),
                    const SizedBox(width: 16.0), // Add spacing between buttons
                    IconButton(
                      icon: Icon(
                        Icons.check,
                        color: _isButtonDisabled
                            ? Colors.green // Dimmed green color
                            : Colors.green,
                      ),
                      onPressed: _isButtonDisabled
                          ? null // Disable button when state is true
                          : () {
                              _updateValidationStatus(context, true);
                            },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
