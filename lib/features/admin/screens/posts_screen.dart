import 'package:amazon_clone/costants/loader.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/screens/add_products.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import '../../../models/product.dart';

class MyAdminPostScreen extends StatefulWidget {
  const MyAdminPostScreen({super.key});

  @override
  State<MyAdminPostScreen> createState() => _MyAdminPostScreenState();
}

class _MyAdminPostScreenState extends State<MyAdminPostScreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        setState(() {
    });
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, MyAdminProductsAdd.routeName);
    setState(() {
    });
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {
            
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const MyLoader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      Gap(10),
                      SizedBox(
                        height: 140,
                        child: MySingleProduct(path: productData.images[0]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                          IconButton(
                              onPressed: () => deleteProduct(productData, index),
                              icon: const Icon(Icons.delete_outlined)),
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              tooltip: "Add Products",
              onPressed: navigateToAddProduct,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
