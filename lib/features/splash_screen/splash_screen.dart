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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
    print('hello i am here');
    Timer(Duration(seconds: 1), () {
      another();
    });
  }
  void pushToBottom(BuildContext context) {
    print('bottom');
    Navigator.pushNamed(context, MyBottomBar.routeName);
  }

  void pushToAdminScreen(BuildContext context) {
    print('admin');
    Navigator.pushNamed(context, MyAdminScreen.routeName);
  }

  void pushToAuthScreen(BuildContext context) {
    print('auth');
    print(Provider.of<UserProvider>(context, listen: false).user.name);
    Navigator.pushNamed(context, MyAuthScreen.routeName);
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
        color: MyGlobalVariables.secondaryColor,
      ),
    );
  }
}
