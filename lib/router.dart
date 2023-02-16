import 'package:amazon_clone/common/Widgets/bottombar.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
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

    case MyBottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyBottomBar());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist!'),
                ),
              ));
  }
}
