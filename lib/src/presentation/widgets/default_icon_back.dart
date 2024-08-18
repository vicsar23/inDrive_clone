import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {
  Color? color;
  EdgeInsetsGeometry? margin;
  DefaultIconBack({super.key, this.color, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: margin,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: color,
          size: 35,
        ),
      ),
    );
  }
}
