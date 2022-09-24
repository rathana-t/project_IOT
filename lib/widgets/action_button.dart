import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.backgroundColor,
      this.color = Colors.white,
      this.fontSize = 18})
      : super(key: key);

  final String title;
  final double fontSize;
  final Function onPressed;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        minimumSize: const Size.fromHeight(55),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize, color: color),
      ),
    );
  }
}
