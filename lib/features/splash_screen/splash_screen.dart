import 'dart:async';

import 'package:amazon_clone/common/Widgets/bottombar.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  final AuthService authService = AuthService();
  bool isUser = false;

  @override
  void initState() {
    super.initState();
    if (isUser) authService.getUserData(context);

    setState(() {
      isUser = true;
    });
    Timer(Duration(seconds: 3), () {
      another();
    });
  }

  void pushToBottom(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MyBottomBar.routeName,
      (route) => false,
    );
  }

  void pushToAdminScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MyAdminScreen.routeName,
      (route) => false,
    );
  }

  void pushToAuthScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MyAuthScreen.routeName,
      (route) => false,
    );
  }

  void another() {
    Provider.of<UserProvider>(context, listen: false).user.token.isNotEmpty
        ? Provider.of<UserProvider>(context, listen: false).user.type == "user"
            ? pushToBottom(context)
            : pushToAdminScreen(context)
        : pushToAuthScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/amazon_icon.png')],
          ),
        ),
      ),
    );
  }
}
