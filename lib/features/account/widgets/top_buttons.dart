import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyTopButtons extends StatefulWidget {
  const MyTopButtons({super.key});

  @override
  State<MyTopButtons> createState() => _MyTopButtonsState();
}

class _MyTopButtonsState extends State<MyTopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MyAccountButton(text: "Your Orders", onTap: (){}),
            MyAccountButton(text: "Turn Seller", onTap: (){}),
          ],
        ),
        Gap(10),
         Row(
          children: [
            MyAccountButton(text: "Log Out", onTap: (){
               Navigator.pushNamedAndRemoveUntil(
                context, MyAuthScreen.routeName, (route) => false);
            }),
            MyAccountButton(text: "Your WishList", onTap: (){}),
          ],
        )
      ],
    );
  }
}