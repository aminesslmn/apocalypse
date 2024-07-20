import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class WelcomeBg extends StatelessWidget {
  const WelcomeBg({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(
          width,
          (width * 0.8333333333333334)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 223, 247, 247)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.7385714);
    path_0.quadraticBezierTo(size.width * 0.0676250, size.height * 0.6768571,
        size.width * 0.2225000, size.height * 0.7471429);
    path_0.cubicTo(
        size.width * 0.3473750,
        size.height * 0.8052857,
        size.width * 0.3925000,
        size.height * 0.8178571,
        size.width * 0.5000000,
        size.height * 0.7800000);
    path_0.cubicTo(
        size.width * 0.7247500,
        size.height * 0.7167857,
        size.width * 0.7043750,
        size.height * 0.7817857,
        size.width * 0.8450000,
        size.height * 0.7471429);
    path_0.quadraticBezierTo(size.width * 1.0598750, size.height * 0.7010714,
        size.width * 1.0130000, size.height * 0.7822857);
    path_0.lineTo(size.width * 1.0040000, size.height * 1.0037143);
    path_0.lineTo(size.width * -0.0025000, size.height * 1.0085714);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
