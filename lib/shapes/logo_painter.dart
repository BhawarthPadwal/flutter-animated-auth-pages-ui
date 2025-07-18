import 'package:flutter/material.dart';

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // First path
    Path path = Path();
    path.moveTo(10, 10);
    path.cubicTo(20, 10, 20, 90, 40, 90);
    path.lineTo(50, 60);
    path.conicTo(40, -8, 10, 10, 1);

    // Second path
    Path path2 = Path();
    path2.moveTo(43, 90);
    path2.lineTo(53, 60);
    path2.conicTo(70, 10, 90, 25, 1);
    path2.cubicTo(85, 20, 90, 100, 45, 90);

    // Add path2 to path
    path.addPath(path2, Offset.zero);

    // Draw the combined path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
