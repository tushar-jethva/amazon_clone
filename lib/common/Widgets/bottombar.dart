import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:badges/badges.dart' as badges;

class MyBottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    const MyHomeScreen(),
    MyAccountScreen(),
    const Center(
      child: Text('Cart Pages'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _page,
        selectedItemColor: MyGlobalVariables.selectedNavBarColor,
        unselectedItemColor: MyGlobalVariables.unselectedNavBarColor,
        backgroundColor: MyGlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: _page == 0
                          ? MyGlobalVariables.selectedNavBarColor
                          : MyGlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth),
                )),
                child: Icon(Icons.home_outlined),
              ),
              label: ''),
          //ACCOUNT
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: _page == 1
                          ? MyGlobalVariables.selectedNavBarColor
                          : MyGlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth),
                )),
                child: Icon(Icons.person_outline_outlined),
              ),
              label: ''),
          //CART
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: _page == 2
                          ? MyGlobalVariables.selectedNavBarColor
                          : MyGlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth),
                )),
                child: badges.Badge(
                  badgeContent: Text('2'),
                  badgeStyle:
                      badges.BadgeStyle(badgeColor: Colors.white, elevation: 0),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
