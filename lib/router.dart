import 'package:amazon_clone/common/Widgets/bottombar.dart';
import 'package:amazon_clone/features/admin/screens/add_products.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/widgets/detail_product.dart';
import 'package:amazon_clone/models/product.dart';
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

    case MyAdminProductsAdd.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyAdminProductsAdd());

    case MyAdminScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyAdminScreen());

    case MyCategoryDeal.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MyCategoryDeal(
                category: category,
              ));

    case MyDetailScreen.routeName:
      Product product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MyDetailScreen(
                product: product,
              ));

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist!'),
                ),
              ));
  }
}
