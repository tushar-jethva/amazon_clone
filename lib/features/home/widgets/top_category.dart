import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/home/screens/category_deals.dart';
import 'package:amazon_clone/features/home/widgets/top_category_oneitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyTopCategories extends StatelessWidget {
  MyTopCategories({super.key});

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, MyCategoryDeal.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //margin: const EdgeInsets.only(top: 1,bottom: 1),
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 75,
          itemCount: MyGlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()=> navigateToCategoryPage(context, MyGlobalVariables.categoryImages[index]['title']!),
                child: MyCategoryOneItem(
                    path: MyGlobalVariables.categoryImages[index]['image'],
                    name: MyGlobalVariables.categoryImages[index]['title']));
          }),
    );
  }
}
