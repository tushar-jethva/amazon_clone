import 'package:amazon_clone/cart/widgets/cart_product.dart';
import 'package:amazon_clone/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/common/Widgets/utills.dart';
import 'package:amazon_clone/common/mycustombutton.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/address/screens/address_Screen.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../features/search/screens/search_screen.dart';

class MyCartScreen extends StatefulWidget {
  static const String routeName = '/my-cart';
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, MySearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(context, MyAddressScreen.routeName,
        arguments: sum.toString());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
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
      body: Column(
        children: [
          const MyAddressBox(),
          const MyCartSubTotal(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCustomButton(
              text: 'Proceed to Buy ${user.cart.length} items',
              onTap: () => user.cart.length == 0
                  ? showSnackBar(context, "Please add item!")
                  : navigateToAddress(sum),
              //() => {
              //   if (user.cart.length == 0)
              //     {
              //       showSnackBar(context, 'Please enter item! '),
              //     }
              //   else
              //     {
              //       () => navigateToAddress(sum),
              //     }
              // },
              color: const Color.fromRGBO(254, 216, 19, 1),
            ),
          ),
          Gap(15),
          Container(
            color: Colors.black12.withOpacity(0.08),
            height: 1,
          ),
          Gap(5),
          Expanded(
            child: ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MyCartProduct(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
