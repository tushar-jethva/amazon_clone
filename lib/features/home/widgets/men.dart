// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/features/product_details/screens/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:amazon_clone/costants/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/home/widgets/men_single.dart';
import 'package:amazon_clone/models/product.dart';

class MyMenCollection extends StatefulWidget {
  final String category;
  const MyMenCollection({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<MyMenCollection> createState() => _MyMenCollectionState();
}

class _MyMenCollectionState extends State<MyMenCollection> {
  HomeServices homeServices = HomeServices();
  List<Product>? productList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllDiscountProduct();
  }

  getAllDiscountProduct() async {
    productList = await homeServices.getDiscountProducts(
        context: context, category: widget.category);
    print(productList![0]);
    setState(() {});
  }

  navigateToDetailScreen(int index) {
    Navigator.pushNamed(context, MyDetailScreen.routeName,
        arguments: productList![index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10),
      width: double.infinity,
      color: Colors.white,
      child: Container(
        height: 400,
        child: productList == null
            ? const MyLoader()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      '${widget.category} | Up to 10% off on select cards',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Gap(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:() => navigateToDetailScreen(0),
                        child: MyMenSingle(
                            path: productList![0].images[0],
                            name: productList![0].name),
                      ),
                      Gap(7),
                      InkWell(
                        onTap:() => navigateToDetailScreen(1),
                        child: MyMenSingle(
                            path: productList![1].images[0],
                            name: productList![1].name),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => navigateToDetailScreen(3),
                          child: MyMenSingle(
                              path: productList![2].images[0],
                              name: productList![2].name),
                        ),
                        Gap(7),
                        InkWell(
                          onTap:() => navigateToDetailScreen(3),
                          child: MyMenSingle(
                              path: productList![3].images[0],
                              name: productList![3].name),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
