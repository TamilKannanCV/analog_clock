import 'dart:async';
import 'dart:math';

import 'package:analog_clock/src/analog_clock_painter.dart';
import 'package:flutter/widgets.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  late Timer _timer;
  DateTime time = DateTime.now();
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = DateTime.now();
        debugPrint(time.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: CustomPaint(
        size: const Size.square(200.0),
        painter: AnalogClockPainter(dateTime: time),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
