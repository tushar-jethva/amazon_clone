import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/home/widgets/top_category_oneitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyTopCategories extends StatelessWidget {
  MyTopCategories({super.key});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
          itemCount: MyGlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return MyCategoryOneItem(path: MyGlobalVariables.categoryImages[index]['image'], name: MyGlobalVariables.categoryImages[index]['title']);
          }),
    );
  }
}
