import 'package:amazon_clone/features/admin/screens/add_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAdminPostScreen extends StatefulWidget {

  const MyAdminPostScreen({super.key});

  @override
  State<MyAdminPostScreen> createState() => _MyAdminPostScreenState();
}

class _MyAdminPostScreenState extends State<MyAdminPostScreen> {
  void navigateToAddProduct() {
    Navigator.pushNamed(context, MyAdminProductsAdd.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Products",
        onPressed: navigateToAddProduct,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
