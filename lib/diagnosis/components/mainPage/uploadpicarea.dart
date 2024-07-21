import 'package:apocalypsea2sv/diagnosis/components/mainPage/buttomsheet.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:apocalypsea2sv/diagnosis/pages/diagnosis_done.dart';
import 'package:dio/dio.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Uploadpicarea extends StatefulWidget {
  const Uploadpicarea({super.key});

  @override
  State<Uploadpicarea> createState() => _UploadpicareaState();
}

class _UploadpicareaState extends State<Uploadpicarea> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _loading = false;

  Future<void> _takePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadPicture() async {
    if (_image == null) {
      print("IMAGE is null");
      return;
    }

    setState(() {
      _loading = true;
    });

    Dio dio = Dio();

    try {
      FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(_image!.path, filename: "photo.jpg"),
      });

      Response response =
          await dio.post("http://192.168.1.2:3000/detect", data: formData);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data as Map<String, dynamic>;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiagnosisDone(
              diagnosis_: data["data"],
              imageURL_: _image!.path,
            ),
          ),
        );
      } else {
        _showError('Failed to upload image');
      }
    } catch (e) {
      print("ERROR: ${e.toString()}");
      _showError(e.toString());
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomSheetWidget(
              takePicture: _takePicture,
              uploadPicture: _uploadPicture,
            );
          },
        );
      },
      child: DottedBorder(
        strokeWidth: 2,
        color: Colors.grey,
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: [5, 5],
        child: _image == null
            ? Container(
                width: 350,
                height: 350,
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        child: SvgPicture.asset(
                          'assets/icons/camera.svg',
                          width: 46,
                          height: 46,
                        ),
                      ),
                      const SizedBox(height: 11),
                      const Text(
                        'Take/Upload Picture for your Skin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4B4B4B),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : _loading
                ? Container(
                    width: 350,
                    height: 350,
                    color: Colors.transparent,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ClipRRect(
                    child: Image.file(_image!, width: 400, height: 350),
                    borderRadius: BorderRadius.circular(20),
                  ),
      ),
    );
  }
}
