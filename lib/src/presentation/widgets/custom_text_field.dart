import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  Function(String text) onChanged;
  String? Function(String?)? validator;

  CustomTextField(
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child: TextFormField(
        validator: validator,
        onChanged: (text){
          onChanged(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(title),
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 11),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(
                  height: 22,
                  width: 1,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
