import 'package:amazon_clone/features/home/widgets/men_single.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class MyMenCollection extends StatelessWidget {
  const MyMenCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,top: 10),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Text('Home appliances | Up to 10% off on select cards',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
           
            children: [
              MyMenSingle(path: 'assets/images/ac.jpg', name: 'AirConditioners'),
              Gap(7),
              MyMenSingle(path: 'assets/images/ref.jpg', name: 'Refrigerators'),
            ],
          ),
          Row(
            children: [
              MyMenSingle(path: 'assets/images/micro.jpg', name: 'Microwaves'),
              Gap(7),
              MyMenSingle(path: 'assets/images/wc.jpg', name: 'Washing machines'),
            ],
          ),
        ],
      ),
    );
  }
}