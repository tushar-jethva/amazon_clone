import 'package:amazon_clone/costants/loader.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/order_detail/order_detail_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAdminOrderScreen extends StatefulWidget {
  const MyAdminOrderScreen({super.key});

  @override
  State<MyAdminOrderScreen> createState() => _MyAdminOrderScreenState();
}

class _MyAdminOrderScreenState extends State<MyAdminOrderScreen> {
  final AdminServices adminServices = AdminServices();
  List<Order>? orderList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllOrders();
  }

  fetchAllOrders() async {
    orderList = await adminServices.fetchAllOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orderList == null
        ? const MyLoader()
        : GridView.builder(
            itemCount: orderList!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final orderData = orderList![index];
              return SizedBox(
                height: 140,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyOrderDetailScreen.routeName,
                        arguments: orderData);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        MySingleProduct(path: orderData.products[0].images[0]),
                  ),
                ),
              );
            });
  }
}
