import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.yellow,
  Colors.green,
  Colors.red,
  Colors.black,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'SelectedColor must be greater than 0'),
        assert(selectedColor < colorList.length,
            'SelectedColor must be greater than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      primaryColor: colorList[selectedColor],
      //colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

  static getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
  static getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }
}
