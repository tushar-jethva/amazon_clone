import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyTopButtons extends StatelessWidget {
  const MyTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MyAccountButton(text: "Your Orders", onTap: () {}),
            MyAccountButton(text: "Turn Seller", onTap: () {}),
          ],
        ),
        Gap(10),
        Row(
          children: [
            MyAccountButton(
                text: "Log Out",
                onTap: () {
                  AccountServices().logOut(context: context);
                }),
            MyAccountButton(text: "Your WishList", onTap: () {}),
          ],
        )
      ],
    );
  }
}
