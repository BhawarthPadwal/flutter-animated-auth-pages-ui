import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue.shade300
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();

    path.moveTo(0, size.height * 0.8);
    path.cubicTo(
      size.width * 0.3,
      size.height * 0.3,
      size.width / 2,
      size.height + (size.height * 0.6),
      size.width,
      size.height * 0.8,
    );

    path.moveTo(size.width * 0.15, size.height * 0.68);
    path.cubicTo(
      200,
      size.height * 0.6,
      250,
      size.height * 1.1,
      size.width * 0.85,
      size.height * 0.99,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
