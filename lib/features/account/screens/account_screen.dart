import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: MyGlobalVariables.appBarGradient,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top:8.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/amazon_in.png',width: 120,height: 45,color: Colors.black,),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 15),child: Icon(Icons.notifications_outlined),),
                      Icon(Icons.search),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: const[
          MyBelowAppBar(),
          Gap(10),
          MyTopButtons(),
          Gap(10),
          MyOrders(),
        ],
      ),
    );
  }
}
