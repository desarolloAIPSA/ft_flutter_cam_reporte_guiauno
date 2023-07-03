// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class HeaderRedondeadoW extends StatelessWidget {
  final double? height;
  final double? width;

  const HeaderRedondeadoW({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,

      child: CustomPaint(
        painter: _HeaderCircular(),
      ),
    );
  }
}

class _HeaderCircular extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color.fromARGB(54, 158, 158, 158);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    //path.moveTo(0, size.height * 0.25);
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.95, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
