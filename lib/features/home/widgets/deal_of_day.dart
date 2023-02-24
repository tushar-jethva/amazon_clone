import 'package:amazon_clone/costants/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day_single.dart';
import 'package:amazon_clone/features/home/widgets/see_all.dart';
import 'package:amazon_clone/features/product_details/screens/detail_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  final HomeServices homeServices = HomeServices();
  List<Product>? product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDealOfDay();
  }

  fetchDealOfDay() async {
    product = await homeServices.getDealOfDay(context: context);
    setState(() {});
  }

  navigateToDetailScreen() {
    Navigator.pushNamed(context, MyDetailScreen.routeName,
        arguments: product![0]);
  }

  navigateToSeeAllProducts() {
    Navigator.pushNamed(context, MySeeAllProduct.routeName, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 485,
            color: Colors.white,
            child: product == null
                ? const MyLoader()
                : Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: const Text(
                          'Deals Of the day',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Gap(2),
                      GestureDetector(
                        onTap: navigateToDetailScreen,
                        child: CachedNetworkImage(
                          imageUrl: product![0].images[0],
                          height: 235,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:
                            const EdgeInsets.only(left: 20, top: 5, right: 10),
                        child: Text(
                          '\$${product![0].price}',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 179, 35, 24)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:
                            const EdgeInsets.only(left: 20, top: 5, right: 10),
                        child: Text(
                          product![0].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Gap(4),
                      //small boxes
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyDetailScreen.routeName,
                                        arguments: product![1]);
                                  },
                                  child: MyDealSingle(
                                      path: product![1].images[0])),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyDetailScreen.routeName,
                                        arguments: product![2]);
                                  },
                                  child: MyDealSingle(
                                      path: product![2].images[0])),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyDetailScreen.routeName,
                                        arguments: product![3]);
                                  },
                                  child: MyDealSingle(
                                      path: product![3].images[0])),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyDetailScreen.routeName,
                                        arguments: product![4]);
                                  },
                                  child: MyDealSingle(
                                      path: product![4].images[0])),
                            ],
                          ),
                        ),
                      ),
                      //over boxes
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: navigateToSeeAllProducts,
                          child: Text(
                            "See all deals",
                            style: TextStyle(color: Colors.cyan[800]),
                          ),
                        ),
                      )
                    ],
                  ))
      ],
    );
  }
}
