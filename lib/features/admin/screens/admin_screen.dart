import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:amazon_clone/features/admin/screens/second_admin_posts.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class MyAdminScreen extends StatefulWidget {
  static const String routeName = 'admin-screen';
  const MyAdminScreen({super.key});

  @override
  State<MyAdminScreen> createState() => _MyAdminScreenState();
}

class _MyAdminScreenState extends State<MyAdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    MyAdminPostScreen(),
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
    final user = Provider.of<UserProvider>(context).user;
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
            padding: const EdgeInsets.only(top: 8.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 120,
                    height: 45,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, MyAuthScreen.routeName, (route) => false);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        
                         
                          const Text(

                              'Admin',
                              style: TextStyle(
                                fontSize: 12,
                                  fontWeight: FontWeight.w400, color: Colors.black),
                            ),
                         
                        
                        Text(user.name,style: TextStyle(
                            fontSize: 18,
                              fontWeight: FontWeight.w500, color: Colors.black),),
                      ],
                    )),
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
          //Posts
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
          //AnalyticalPage
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
                child: Icon(Icons.analytics_outlined),
              ),
              label: ''),
          //Orders
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
                child: Icon(Icons.all_inbox_outlined),
              ),
              label: ''),
        ],
      ),
    );
  }
}
