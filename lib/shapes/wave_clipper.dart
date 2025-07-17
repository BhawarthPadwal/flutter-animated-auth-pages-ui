import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.85);

    path.cubicTo(
      size.width * 0.3,
      size.height * 0.58,
      size.width / 2,
      size.height + (size.height * 0.28),
      size.width,
      size.height * 0.85,
    );

    // Connect to bottom-right, bottom-left and close
    path.lineTo(size.width, 0); // Go to top-right
    path.lineTo(0, 0); // Go back to top-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
