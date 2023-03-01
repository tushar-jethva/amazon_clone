import 'package:cached_network_image/cached_network_image.dart';
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
                child: CachedNetworkImage(
                  imageUrl: path,
                  width: 180,
                )),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1.5))));
  }
}
