// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyStars extends StatelessWidget {
  final double rating;
  const MyStars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        direction: Axis.horizontal,
        itemCount: 5,
        rating: rating,
        itemSize: 15,
        itemBuilder: (context, _)=> 
          const Icon(
            Icons.star,
            color: MyGlobalVariables.secondaryColor,
          )
        );
  }
}
