import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MyCustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}
