import 'package:flutter/material.dart';

class MySingleProduct extends StatelessWidget {
  final String path;
  MySingleProduct({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DecoratedBox(
          child: Container(
              width: 180,
              padding: const EdgeInsets.all(5),
              child: Image.asset(path,fit: BoxFit.fitHeight,width: 180,)),
        
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.black12, width: 1.5))));
  }
}
