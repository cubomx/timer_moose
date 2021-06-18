import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class CircleNeon extends StatefulWidget {
  final Color color;
  final double radius;
  final int shadowSpread;
  final double strokeWidth;
  final int spreadValue;
  final Widget child;
  int time;
  CircleNeon(
      {required Key key,
      required this.color,
      required this.radius,
      required this.shadowSpread,
      required this.strokeWidth,
      required this.spreadValue,
      required this.child,
      required this.time})
      : super(key: key);

  @override
  _CircleNeonState createState() => _CircleNeonState();
}

class _CircleNeonState extends State<CircleNeon> {
  late Timer _timer;
  int time = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      if (time == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          time--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    time = widget.time;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CustomPaint(
          painter: ShapePainter(
            color: widget.color,
            radius: widget.radius,
            shadowSpread: widget.shadowSpread,
            strokeWidth: widget.strokeWidth,
            spreadValue: widget.spreadValue,
            quantity: (pi * 2) * ((widget.time - time) / widget.time),
          ),
          child: widget.child == null ? Container() : widget.child,
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final Color color;
  final double radius;
  final int shadowSpread;
  final double strokeWidth;
  final int spreadValue;
  final double quantity;
  ShapePainter(
      {required this.strokeWidth,
      required this.radius,
      required this.color,
      required this.shadowSpread,
      required this.spreadValue,
      required this.quantity});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    List shadows = [];
    for (var i = 1; i <= shadowSpread; i++) {
      var shadow = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..maskFilter = MaskFilter.blur(
            BlurStyle.outer, convertRadiusToSigma((i * spreadValue).toDouble()))
        ..strokeCap = StrokeCap.round;
      shadows.add(shadow);
    }

    var stroke = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect =
        Rect.fromCenter(center: center, width: radius * 2, height: radius * 2);

    shadows.forEach((element) {
      canvas.drawArc(rect, -(pi / 2), quantity, false, element);
    });
    canvas.drawArc(rect, -(pi / 2), quantity, false, stroke);
    canvas.drawArc(rect, -(pi / 2), quantity, false, paint);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
