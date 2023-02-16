import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  //temporary list
  List list = ['assets/images/iphone.jpg', 'assets/images/macbookpro.jpeg', 'assets/images/samsung.jpeg','assets/images/imac.jpeg'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 9),
              child: Text(
                "See all",
                style: TextStyle(
                  color: MyGlobalVariables.selectedNavBarColor,
                ),
              ),
            )
          ],
        ),
        //Display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return MySingleProduct(path: list[index],);
              }),
        )
      ],
    );
  }
}
