import 'package:amazon_clone/features/Screens/home_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MyAuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyAuthScreen());

     case MyHomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyHomeScreen());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist!'),
                ),
              ));
  }
}
