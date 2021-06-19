import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:timer_moose/helpers/convert.dart';

// ignore: must_be_immutable
class CircleNeon extends StatefulWidget {
  final Color color;
  final double radius;
  final int shadowSpread;
  final double strokeWidth;
  final int spreadValue;
  final Widget child;
  final double quantity;
  final Function callback;
  final String hintText;
  final bool itsWorking;
  CircleNeon(
      {required Key key,
      required this.color,
      required this.radius,
      required this.shadowSpread,
      required this.strokeWidth,
      required this.spreadValue,
      required this.child,
      required this.quantity,
      required this.callback,
      required this.hintText,
      required this.itsWorking})
      : super(key: key);

  @override
  _CircleNeonState createState() => _CircleNeonState();
}

class _CircleNeonState extends State<CircleNeon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          widget.callback();
        },
        child: Container(
          width: widget.radius * 2,
          height: widget.radius * 2,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CustomPaint(
            painter: ShapePainter(
              color: widget.color,
              radius: widget.radius,
              shadowSpread: widget.shadowSpread,
              strokeWidth: widget.strokeWidth,
              spreadValue: widget.spreadValue,
              quantity: widget.quantity,
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.child,
                widget.itsWorking
                    ? GlowText(widget.hintText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))
                    : Container(),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  late Rect rect1;
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

    var toFill = Paint()
      ..color = createMaterialColor(Color(0x3fffffff))
      ..strokeWidth = strokeWidth * 2
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
    rect1 =
        Rect.fromCenter(center: center, width: radius * 2, height: radius * 2);
    Rect rect =
        Rect.fromCenter(center: center, width: radius * 2, height: radius * 2);
    // for the blurring effect
    shadows.forEach((element) {
      canvas.drawArc(rect, -(pi / 2), quantity, false, element);
    });
    // -(pi/2) is at 90°
    canvas.drawArc(rect, -(pi / 2), quantity, false, stroke);
    canvas.drawArc(rect, -(pi / 2), quantity, false, paint);
    // the circle to be filled
    canvas.drawArc(rect, (pi / 2), 2 * pi, false, toFill);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
