import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/widgets/men.dart';
import 'package:amazon_clone/features/home/widgets/top_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import '../../../costants/globalvariables.dart';

class MyHomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyGlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: MyGlobalVariables.appBarGradient,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                      margin: const EdgeInsets.only(left: 5),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search Amazon.in',
                            hintStyle: const TextStyle(
                             fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: const EdgeInsets.only(left: 6),
                                
                                child: Icon(Icons.select_all_rounded,color: Colors.black54,),
                              ),
                            ),
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Icon(Icons.search_outlined,color: Colors.black,),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                          ),
                        ),
                      )),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.only(left: 8,right: 5),
                  child: const Icon(Icons.mic,color: Colors.black,size: 25,),
                )
              ],
            ),
          ),
        ),
      ),
     body: SingleChildScrollView(
       child: Column(
        children: [
          MyAddressBox(),
          Gap(4),
          MyTopCategories(),
          Gap(4),
          MyCarouselImage(),
          Gap(4),
          MyDealOfDay(),
          Gap(4),
          MyMenCollection(),
          Gap(4),
        ],
       ),
     ),
    );
  }
}
