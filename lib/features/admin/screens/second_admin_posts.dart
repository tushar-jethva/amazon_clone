import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/admin/screens/products_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MySecond extends StatefulWidget {
  const MySecond({super.key});
 
  @override
  State<MySecond> createState() => _MySecondState();
}

class _MySecondState extends State<MySecond> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: ListView.builder(
        itemCount: MyGlobalVariables.categoryImages.length,
        itemBuilder: (context,index){

      }),
    );
  }
}
