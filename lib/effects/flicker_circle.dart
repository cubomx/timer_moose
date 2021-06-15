import 'package:flutter/material.dart';

class FlickerCircle extends StatefulWidget {
  final Color color;
  final int shadowSpread;
  final double strokeWidth;
  final int spreadValue;
  final Widget child;
  const FlickerCircle(
      {required Key key,
      required this.color,
      required this.shadowSpread,
      required this.strokeWidth,
      required this.spreadValue,
      required this.child})
      : super(key: key);
  @override
  _FlickerCircleState createState() => _FlickerCircleState();
}

class _FlickerCircleState extends State<FlickerCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: 110,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: widget.child,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomPaint(
                    painter: ShapePainter(
                      color: widget.color,
                      shadowSpread: widget.shadowSpread,
                      strokeWidth: widget.strokeWidth,
                      spreadValue: widget.spreadValue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class ShapePainter extends CustomPainter {
  final Color color;
  final int shadowSpread;
  final double strokeWidth;
  final int spreadValue;
  ShapePainter(
      {required this.strokeWidth,
      required this.color,
      required this.shadowSpread,
      required this.spreadValue});
  @override
  void paint(Canvas canvas, Size size) {
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

    Rect rect1 =
        new Rect.fromCenter(center: Offset.zero, width: 100, height: 100);
    shadows.forEach((element) {
      canvas.drawRect(rect1, element);
    });
    Rect rect =
        new Rect.fromCenter(center: Offset.zero, width: 100, height: 100);
    canvas.drawRect(rect, stroke);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
