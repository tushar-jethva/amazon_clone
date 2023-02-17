// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class MyMenSingle extends StatelessWidget {
  final String path;
  final String name;
  const MyMenSingle({
    Key? key,
    required this.path,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 185,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            
          ),
          child: Image.asset(path),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(name))
      ],
    );
  }
}
