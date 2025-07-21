import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final double waveShift;

  WaveClipper(this.waveShift);

  @override
  Path getClip(Size size) {
    final path = Path();
    final double waveHeight = 20;
    final double waveLength = size.width;

    path.lineTo(0, size.height * 0.85);

    for (double i = 0; i <= waveLength; i++) {
      double dx = i;
      double dy =
          size.height * 0.85 +
          math.sin((i / waveLength * 2 * math.pi) - waveShift) * waveHeight;

      path.lineTo(dx, dy);
    }

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant WaveClipper oldClipper) =>
      oldClipper.waveShift != waveShift;
}

// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class WaveClipper extends CustomClipper<Path> {
//   final double waveShift;

//   WaveClipper(this.waveShift);

//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final double waveHeight = 20;
//     final double waveLength = size.width;

//     path.lineTo(0, size.height * 0.85);

//     for (double i = 0; i <= waveLength; i++) {
//       double dx = i;
//       double dy = size.height * 0.85 +
//           math.sin((i / waveLength * 2 * math.pi) + waveShift * math.pi) *
//               waveHeight;

//       path.lineTo(dx, dy);
//     }

//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant WaveClipper oldClipper) =>
//       oldClipper.waveShift != waveShift;
// }
