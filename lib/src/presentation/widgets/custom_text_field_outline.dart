import 'package:flutter/material.dart';

class CustomTextFieldOutline extends StatelessWidget {
  final String title;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  String? Function(String?)? validator;
  Function(String text) onChanged;

  CustomTextFieldOutline(
      {super.key,
      required this.title,
      required this.icon,
      this.margin = const EdgeInsets.only(top: 40, left: 4, right: 4),
      required this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // EdgeInsets.only(top: 40, left: 4, right: 4),
      height: 50,
      // decoration: BoxDecoration(
      //   color: Color.fromRGBO(255, 255, 255, 0.2),
      //   borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      // ),
      child: TextFormField(
        onChanged: (text){
          onChanged(text);
        },
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 15, 64, 88), width: 2)),
          border: InputBorder.none,
          label: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 11),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Container(
                  height: 22,
                  width: 1,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
