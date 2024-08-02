// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType textInputTypee;
  final bool isPassword;
  final String hinttexttt;
  Function(String)? onChanged;

  MyTextField({
    Key? key,
    required this.textInputTypee,
    required this.isPassword,
    required this.hinttexttt,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onChanged,
      keyboardType: textInputTypee,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hinttexttt,
        //To delete borders
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        //fillColor: Colors.red,
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }
}
