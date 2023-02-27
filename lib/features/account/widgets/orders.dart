import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/costants/loader.dart';
import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/order_detail/order_detail_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final AccountServices services = AccountServices();
  List<Order>? Orderlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllOrders();
  }

  fetchAllOrders() async {
    Orderlist = await services.fetchAllOrders(context: context);
    setState(() {});
  }

  void navigateToDetailScreen(Order order) {
    Navigator.pushNamed(context, MyOrderDetailScreen.routeName,arguments: order);
  }

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
              padding: const EdgeInsets.only(left: 15, right: 9),
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
          child: Orderlist == null
              ? const MyLoader()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Orderlist!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: ()=>navigateToDetailScreen(Orderlist![index]),
                      child: MySingleProduct(
                        path: Orderlist![index].products[0].images[0],
                      ),
                    );
                  }),
        )
      ],
    );
  }
}
