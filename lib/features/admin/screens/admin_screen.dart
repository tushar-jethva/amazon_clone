import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:badges/badges.dart' as badges;

class MyAdminScreen extends StatefulWidget {
  const MyAdminScreen({super.key});

  @override
  State<MyAdminScreen> createState() => _MyAdminScreenState();
}

class _MyAdminScreenState extends State<MyAdminScreen> {

    int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    const Center(
      child: Text('Posts Pages'),
    ),
    const Center(
      child: Text('Analytics Pages'),
    ),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: MyGlobalVariables.appBarGradient,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top:8.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/amazon_in.png',width: 120,height: 45,color: Colors.black,),
                ),
                const Text('Admin',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              ],
            ),
          ),
        ),
      ),
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