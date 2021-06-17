import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String screenTitle;
  final Function leftAction;
  final List leftArgs;
  final IconData leftIcon;
  MyAppBar(
      {required Key key,
      required this.screenTitle,
      required this.leftAction,
      required this.leftArgs,
      required this.leftIcon})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(widget.leftIcon),
        onPressed: () {
          Function.apply(widget.leftAction, widget.leftArgs);
        },
      ),
      title: Text(
        widget.screenTitle,
        style: TextStyle(fontFamily: 'Lastica', fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Help')));
            },
            icon: Icon(Icons.help))
      ],
    );
  }
}
