import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClockPainter extends CustomPainter {
  final DateTime dateTime;
  AnalogClockPainter({super.repaint, required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(size.width, size.height);

    final clockBrush = Paint()..color = Colors.grey.shade200;

    final borderBrush = Paint()
      ..color = Colors.grey
      ..strokeWidth = 16.0
      ..style = PaintingStyle.stroke;

    final pointBrush = Paint();

    canvas.drawCircle(center, radius - 40.0, clockBrush);
    canvas.drawCircle(center, radius - 40.0, borderBrush);
    canvas.drawCircle(center, radius - 40.0, borderBrush);
    final secHandX = centerX + 120 * cos(dateTime.second * 6 * pi / 180);
    final secHandY = centerY + 120 * sin(dateTime.second * 6 * pi / 180);
    final secondsBrush = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;
    canvas.drawLine(center, Offset(secHandX, secHandY), secondsBrush);
    canvas.drawCircle(center, 20.0, pointBrush);
    final minHandX = centerX + 100 * cos(dateTime.minute * 6 * pi / 180);
    final minHandY = centerY + 100 * sin(dateTime.minute * 6 * pi / 180);
    final minBrush = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;
    canvas.drawLine(center, Offset(minHandX, minHandY), minBrush);
    canvas.drawCircle(center, 20.0, pointBrush);
    final hrHandX = centerX + 60 * cos(dateTime.hour * 30 * pi / 180);
    final hrHandY = centerY + 60 * sin(dateTime.hour * 30 * pi / 180);
    final hrBrush = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;
    canvas.drawLine(center, Offset(hrHandX, hrHandY), hrBrush);
    canvas.drawCircle(center, 20.0, pointBrush);

    for (var i = 0; i < 60; i++) {
      final lineBrush = Paint()..color = Colors.black;
      final x1 = centerX + radius * cos(i * 6 * pi / 180);
      final y1 = centerY + radius * sin(i * 6 * pi / 180);

      final x2 = centerX + (radius - 14) * cos(i * 6 * pi / 180);
      final y2 = centerY + (radius - 14) * sin(i * 6 * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), lineBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
