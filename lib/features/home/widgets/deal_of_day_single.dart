// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:amazon_clone/costants/globalvariables.dart';

class MyDealSingle extends StatelessWidget {
  final String path;
  MyDealSingle({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DecoratedBox(
          child: Container(
              width: 50,
              padding: const EdgeInsets.all(5),
              child: CachedNetworkImage(imageUrl: path,fit: BoxFit.contain,width: 50,))
              ,
    
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.black12, width: 1.5))));
  }
}
