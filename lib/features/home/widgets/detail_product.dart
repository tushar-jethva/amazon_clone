// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:amazon_clone/models/product.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_outlined)
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: MyGlobalVariables.appBarGradient),
        ),
        title: Text(
          widget.product.name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
