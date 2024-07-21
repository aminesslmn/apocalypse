import 'package:apocalypsea2sv/config/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DiagnosisService {
  final Dio _dio = Dio();

  Future<String?> sendSymptoms(BuildContext context, String value) async {
    if (value.isEmpty) {
      print("Value is null");
      return null;
    }

    try {
      Map<String, dynamic> body = {'symptoms': value};

      Response response =
          await _dio.post(APIConfig.APIURL_POST_DIAGNOSE, data: body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data as Map<String, dynamic>;

        print(data);

        return data["data"]["llm_response"];
      } else {
        _showError(context, 'Failed to upload image');

        return null;
      }
    } catch (e) {
      print("ERROR: ${e.toString()}");
      _showError(context, e.toString());

      return null;
    }
  }

  void _showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
