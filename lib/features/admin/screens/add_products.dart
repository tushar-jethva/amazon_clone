import 'dart:io';

import 'package:amazon_clone/common/Widgets/MyTextField.dart';
import 'package:amazon_clone/common/Widgets/utills.dart';
import 'package:amazon_clone/common/mycustombutton.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class MyAdminProductsAdd extends StatefulWidget {
  static const String routeName = '/add-products';
  const MyAdminProductsAdd({super.key});

  @override
  State<MyAdminProductsAdd> createState() => _MyAdminProductsAddState();
}

class _MyAdminProductsAddState extends State<MyAdminProductsAdd> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _discriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _productNameController.dispose();
    _discriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
  }

  List<File> images = [];

  List<String> productCategory = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void navigateToPostScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, MyAdminScreen.routeName, (route) => false);
  }

  String category = "Mobiles";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(57),
          child: AppBar(
            leading: InkWell(
                onTap: navigateToPostScreen,
                child: Icon(Icons.arrow_back_ios_new)),
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(gradient: MyGlobalVariables.appBarGradient),
            ),
            title: const Text(
              "Add Product",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Gap(30),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ));
                        }).toList(),
                        options: CarouselOptions(
                           enableInfiniteScroll: false,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 1000),
                            pauseAutoPlayOnTouch: true))
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                Gap(15),
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                Gap(30),
                MyCustomTextField(
                    controller: _productNameController,
                    hintText: "Product Name"),
                Gap(10),
                MyCustomTextField(
                  controller: _discriptionController,
                  hintText: "Discription",
                  maxLines: 7,
                ),
                Gap(10),
                MyCustomTextField(
                    controller: _priceController, hintText: "Price"),
                Gap(10),
                MyCustomTextField(
                    controller: _quantityController, hintText: "Quantity"),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: productCategory.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newval) {
                      setState(() {
                        category = newval!;
                      });
                    },
                  ),
                ),
                Gap(30),
                MyCustomButton(onTap: () {}, text: 'Sell'),
                Gap(20),
              ],
            ),
          )),
        ));
  }
}
