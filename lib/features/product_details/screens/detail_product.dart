// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/common/mycustombutton.dart';
import 'package:amazon_clone/common/stars.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_image.dart';
import 'package:amazon_clone/features/product_details/services/product_details_services.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:amazon_clone/models/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MyDetailScreen extends StatefulWidget {
  final Product product;
  static const String routeName = '/detail-screen';
  const MyDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<MyDetailScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyDetailScreen> {
  final ProductDetailServices productDetailServices = ProductDetailServices();

  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, MySearchScreen.routeName, arguments: query);
  }

  void navigateToHomeScreen() {
    //Navigator.pushNamedAndRemoveUntil(context, MyHomeScreen.routeName, (route) => false);
    Navigator.pop(context);
  }

  void addToCart() {
    productDetailServices.addToCart(context: context, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyGlobalVariables.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: InkWell(
            onTap: navigateToHomeScreen,
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
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
                          onFieldSubmitted: navigateToSearchScreen,
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
                  margin: const EdgeInsets.only(left: 8, right: 5),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAddressBox(),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Visit the Tej Store',
                    style: TextStyle(color: Colors.teal),
                  ),
                  MyStars(rating: avgRating),
                ],
              ),
            ),
            Gap(4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.product.name,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CarouselSlider(
                  items: widget.product.images.map((i) {
                    return Builder(
                        builder: (BuildContext context) => CachedNetworkImage(
                              imageUrl: i,
                              height: 250,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ));
                    //Image.network(i, fit: BoxFit.cover, height: 200));
                  }).toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 350,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    scrollDirection: Axis.horizontal,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    pauseAutoPlayOnTouch: false,
                  )),
            ),
            Container(
              color: Colors.black12,
              height: 3.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                    text: 'Price:',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '\$${widget.product.price}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 179, 35, 24),
                            fontWeight: FontWeight.w500),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 7),
              child: Text(
                'About this item',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.product.description,
              ),
            ),
            Container(
              color: Colors.black12,
              height: 3.5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomButton(onTap: () {}, text: 'Buy Now'),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MyCustomButton(
                onTap:addToCart,
                text: 'Add to Cart',
                color: const Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
            Gap(10),
            Container(
              color: Colors.black12,
              height: 3.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text(
                'Rate the Product',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.5),
              child: RatingBar.builder(
                  initialRating: myRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 35,
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: MyGlobalVariables.secondaryColor,
                      ),
                  onRatingUpdate: (rating) {
                    productDetailServices.rateProduct(
                        context: context,
                        product: widget.product,
                        rating: rating);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
