import 'package:flutter/material.dart';

class SquareNeon extends StatefulWidget {
  final Color color;
  final int shadowSpread;
  final double strokeWidth;
  final int spreadValue;
  final Widget child;
  final double width, height;
  const SquareNeon(
      {required Key key,
      required this.color,
      required this.shadowSpread,
      required this.strokeWidth,
      required this.spreadValue,
      required this.child,
      required this.width,
      required this.height})
      : super(key: key);
  @override
  _SquareNeonState createState() => _SquareNeonState();
}

class _SquareNeonState extends State<SquareNeon> {
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
                        width: widget.width,
                        height: widget.height),
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
  final double height, width;
  ShapePainter(
      {required this.strokeWidth,
      required this.color,
      required this.shadowSpread,
      required this.spreadValue,
      required this.width,
      required this.height});
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

    Rect rect =
        new Rect.fromCenter(center: Offset.zero, width: width, height: height);
    shadows.forEach((element) {
      canvas.drawRect(rect, element);
    });
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
