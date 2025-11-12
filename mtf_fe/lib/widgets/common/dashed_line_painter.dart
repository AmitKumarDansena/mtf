import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

// ✅ Custom Painter for the Dashed Line
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD1D1D1)
      ..strokeWidth = 1;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);
    canvas.drawPath(
      dashPath(path, dashArray: CircularIntervalList<double>([5.0, 5.0])),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
