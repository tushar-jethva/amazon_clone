import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBelowAppBar extends StatelessWidget {
  const MyBelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: MyGlobalVariables.appBarGradient,
        ),
        padding: const EdgeInsets.only(left: 25, right: 10, bottom: 10,top: 3),
        child: RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: TextStyle(fontSize: 22, color: Colors.black),
                children: [TextSpan(text: user.name,style: TextStyle(fontWeight: FontWeight.w600))])));
  }
}
