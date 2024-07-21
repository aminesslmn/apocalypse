import 'package:apocalypsea2sv/features/detection/components/mainPage/buttomsheet.dart';
import 'package:apocalypsea2sv/services/detect.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

class Uploadpicarea extends StatefulWidget {
  const Uploadpicarea({super.key});

  @override
  State<Uploadpicarea> createState() => _UploadpicareaState();
}

class _UploadpicareaState extends State<Uploadpicarea> {
  File? _image;
  bool _loading = false;

  Future<void> _takePicture() async {
    _image = await DetectService().takePicture();

    if (_image == null) {
      print('No image selected.');
    }

    setState(() {});
  }

  Future<void> _uploadPicture() async {
    if (_image == null) {
      print('No image selected.');
    }

    setState(() {
      _loading = true;
    });

    bool status = await DetectService().uploadPicture(context, _image!);

    setState(() {
      _loading = false;
    });
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
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      _image!,
                      width: 400,
                      height: 350,
                    ),
                  ),
      ),
    );
  }
}
