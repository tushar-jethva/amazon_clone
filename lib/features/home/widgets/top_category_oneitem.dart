// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyCategoryOneItem extends StatelessWidget {
  final String? path;
  final String? name;
  const MyCategoryOneItem({
    Key? key,
    required this.path,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              path!,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
        ),
        Text(name!,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
      ],
    );
  }
}
