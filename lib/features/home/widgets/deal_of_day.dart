import 'package:amazon_clone/features/home/widgets/deal_of_day_single.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class MyDealOfDay extends StatefulWidget {
  const MyDealOfDay({super.key});

  @override
  State<MyDealOfDay> createState() => _MyDealOfDayState();
}

class _MyDealOfDayState extends State<MyDealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child:Column(
            children: [
             Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deals Of the day',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
          ),
        ),
        Gap(2),
        Image.asset(
          'assets/images/samsung.jpeg',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20,top: 5,right: 10),
          child: Text('\$999.0',maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20,top: 5,right: 10),
          child: Text('Samsung S22 Ultra',maxLines: 2,overflow: TextOverflow.ellipsis,),
        ),
        Gap(4),
        Container(
          child: SingleChildScrollView(
            
            scrollDirection: Axis.horizontal,
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyDealSingle(path: 'assets/images/asus.jpg'),
                MyDealSingle(path: 'assets/images/air.jpg'),
                MyDealSingle(path: 'assets/images/tab.jpg'),
                MyDealSingle(path: 'assets/images/pro.jpg'),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
          alignment: Alignment.topLeft,
          child: Text("See all deals",style: TextStyle(color: Colors.cyan[800]),),
        )
          ],)
        )
      ],
    );
  }
}
