// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/costants/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/product_details/screens/detail_product.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:gap/gap.dart';

class MySeeAllProduct extends StatefulWidget {
  static const String routeName = '/see-all';
  final List<Product>? product;
  const MySeeAllProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<MySeeAllProduct> createState() => _MySeeAllProductState();
}

class _MySeeAllProductState extends State<MySeeAllProduct> {
  void navigateToHomeScreen() {
    //Navigator.pushNamedAndRemoveUntil(context, MyHomeScreen.routeName, (route) => false);
    Navigator.pop(context);
  }

  void navigateToDetailScreen(BuildContext context, Product product) {
    Navigator.pushNamed(context, MyDetailScreen.routeName, arguments: product);
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, MySearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: InkWell(
              onTap: navigateToHomeScreen,
              child: Icon(Icons.arrow_back_ios_new_outlined)),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: MyGlobalVariables.appBarGradient,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.9, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      height: 42,
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: 1,
                        child: TextFormField(
                          onFieldSubmitted: navigateToSearchScreen,
                          decoration: InputDecoration(
                            hintText: 'Search in Amazon.in',
                            hintMaxLines: 1,
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.select_all_rounded,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search_outlined,
                                  color: Colors.black,
                                ),
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
                  margin: const EdgeInsets.only(left: 4, right: 0),
                  child: const Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: widget.product == null
          ? const MyLoader()
          : GridView.builder(
              //scrollDirection: Axis.vertical,
              //padding: const EdgeInsets.only(left: 15),
              itemCount: widget.product!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final product = widget.product![index];
                return InkWell(
                  onTap: () => navigateToDetailScreen(context, product),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(10),
                      SizedBox(
                        height: 130,
                        width: 130,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              // border:
                              //     Border.all(color: Colors.black, width: 0.5),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: CachedNetworkImage(
                              imageUrl: product.images[0],
                              height: 130,
                              width: 130,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 2, top: 5, right: 15),
                        child: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
