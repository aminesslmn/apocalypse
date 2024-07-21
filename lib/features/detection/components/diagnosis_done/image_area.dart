import 'dart:io';

import 'package:flutter/material.dart';

class ImageArea extends StatelessWidget {
  String url = "";

  ImageArea({super.key, url_}) {
    url = url_;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.file(
          File(url),
          width: 350,
          height: 350,
        ),
      ),
    );
  }
}
