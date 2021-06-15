import 'package:flutter/material.dart';

class GlowCircle extends StatefulWidget {
  @override
  _GlowCircleState createState() => _GlowCircleState();
}

class _GlowCircleState extends State<GlowCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      height: (MediaQuery.of(context).size.height) - 40,
      width: (MediaQuery.of(context).size.width) - 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 0, 0, 0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(130, 255, 255, 255),
                blurRadius: _animation.value,
                spreadRadius: _animation.value),
            BoxShadow(
                color: Color.fromARGB(130, 255, 255, 255),
                blurRadius: _animation.value,
                spreadRadius: -_animation.value),
          ]),
    );
  }
}
