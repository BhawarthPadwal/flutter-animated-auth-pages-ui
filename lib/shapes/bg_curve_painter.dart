// import 'package:flutter/material.dart';

// class BgCurvePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue.shade100
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, 40);
//     path.conicTo(size.width / 2, 150, size.width, 40, 1);
//     path.lineTo(size.width, 130);
//     path.conicTo(size.width / 2, 210, 0, 130, 1);

//     Paint paint2 = Paint()
//       ..color = Colors.blue.shade300
//       ..style = PaintingStyle.fill;

//     Path path2 = Path();
//     path2.moveTo(0, 20);
//     path2.conicTo(size.width / 2, 150, size.width, 70, 1);
//     path2.lineTo(size.width, 160);
//     path2.conicTo(size.width / 2, 210, 0, 110, 1);

//     canvas.drawPath(path, paint);
//     canvas.drawPath(path2, paint2);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
import 'package:flutter/material.dart';

class BgCurvePainter extends CustomPainter {
  final double animationValue;

  BgCurvePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue.shade100
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, 40 + 10 * animationValue); // Apply animation offset
    path.conicTo(
      size.width / 2 + 20 * animationValue, // shift midpoint
      150,
      size.width,
      40 + 10 * animationValue,
      1,
    );
    path.lineTo(size.width, 130);
    path.conicTo(size.width / 2 + 20 * animationValue, 210, 0, 130, 1);

    final Paint paint2 = Paint()
      ..color = Colors.blue.shade300
      ..style = PaintingStyle.fill;

    final Path path2 = Path();
    path2.moveTo(0, 20 + 10 * animationValue);
    path2.conicTo(
      size.width / 2 - 20 * animationValue,
      150,
      size.width,
      70 + 10 * animationValue,
      1,
    );
    path2.lineTo(size.width, 160);
    path2.conicTo(size.width / 2 - 20 * animationValue, 210, 0, 110, 1);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant BgCurvePainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
