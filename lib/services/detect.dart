import 'dart:io';

import 'package:apocalypsea2sv/config/api_config.dart';
import 'package:apocalypsea2sv/features/detection/pages/diagnosis_done.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetectService {
  final Dio _dio = Dio();

  final ImagePicker _picker = ImagePicker();

  Future<File?> takePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<bool> uploadPicture(BuildContext context, File image) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path, filename: "photo.jpg"),
      });

      Response response =
          await _dio.post(APIConfig.APIURL_POST_DETECT, data: formData);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data as Map<String, dynamic>;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiagnosisDone(
              diagnosis_: data["data"],
              imageURL_: image!.path,
            ),
          ),
        );

        return true;
      } else {
        _showError(context, 'Failed to upload image');

        return false;
      }
    } catch (e) {
      print("ERROR: ${e.toString()}");
      _showError(context, e.toString());

      return false;
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
