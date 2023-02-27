// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MyOrderDetailScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const MyOrderDetailScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<MyOrderDetailScreen> createState() => _MyOrderDetailScreenState();
}

class _MyOrderDetailScreenState extends State<MyOrderDetailScreen> {
  int currentStep = 0;

  navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, MySearchScreen.routeName, arguments: query);
  }

  navigateToHomeScreen() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentStep = widget.order.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'View order details',
                style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.bold),
              ),
              Gap(5),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Date:   ${DateFormat().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            widget.order.orderAt),
                      )}'),
                      Text('Order ID:       ${widget.order.id}'),
                      Text('Order Total:  ${widget.order.totalPrice}'),
                    ],
                  ),
                ),
              ),
              Gap(10),
              const Text(
                'Purchase Details',
                style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < widget.order.products.length; i++)
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.order.products[i].images[0],
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Gap(10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.order.products[i].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Qty: ${widget.order.quantity[i]}'),
                              ],
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
              Gap(10),
              const Text(
                'Tracking',
                style: TextStyle(fontSize: 19.5, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                ),
                child: Stepper(
                    currentStep: currentStep,
                    controlsBuilder: (context, details) {
                      return const SizedBox();
                    },
                    steps: [
                      Step(
                          title: const Text('Pending'),
                          content:
                              const Text('Your order is yet to be delivered'),
                          isActive: currentStep == 0,
                          state: currentStep == 0
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: const Text('Completed'),
                          content: const Text('Your order has been delivered'),
                          isActive: currentStep > 1,
                          state: currentStep > 1
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: const Text('Received'),
                          content: const Text(
                              'Your order has been delivered and signed by you'),
                          isActive: currentStep > 2,
                          state: currentStep > 2
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: const Text('Delivered'),
                          content: const Text(
                              'Your order has been delivered and signed by you'),
                          isActive: currentStep > 3,
                          state: currentStep >= 3
                              ? StepState.complete
                              : StepState.indexed),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
