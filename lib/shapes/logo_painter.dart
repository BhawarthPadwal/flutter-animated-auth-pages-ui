import 'package:flutter/material.dart';

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(10, 10);
    path.cubicTo(10, 10, 30, 100, 40, 90);
    path.lineTo(50, 60);
    path.conicTo(40, -8, 10, 10, 1);

    Path path2 = Path();
    path2.moveTo(50, 50);
    path2.lineTo(60, 70);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
