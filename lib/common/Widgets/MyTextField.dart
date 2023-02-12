import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  MyCustomTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
       validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
