import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class ButtonChange extends StatelessWidget {
  final List args;
  final Function changeAction;
  final MaterialColor iconColor;
  final IconData icon;
  const ButtonChange(
      {required this.args,
      required this.changeAction,
      required this.iconColor,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 60, height: 60),
      child: Center(
        child: IconButton(
          onPressed: () {
            Function.apply(changeAction, args);
          },
          icon: GlowIcon(
            icon,
            blurRadius: 5,
            glowColor: iconColor,
          ),
          color: iconColor,
        ),
      ),
    );
  }
}
