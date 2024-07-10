import 'package:flutter/material.dart';

class DefaulButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final EdgeInsetsGeometry margin;

  const DefaulButton(
      {super.key,
      required this.text,
      this.textColor = Colors.white,
      this.buttonColor = Colors.blue,
      this.margin = const EdgeInsets.only(right: 10, left: 10, bottom: 15)});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: 45,
      width: sizeScreen.width,
      margin: margin,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
    );
  }
}
