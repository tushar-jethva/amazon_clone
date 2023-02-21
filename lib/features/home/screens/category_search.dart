// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/costants/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/features/search/widget/search_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:amazon_clone/models/product.dart';

class MyCategorySearch extends StatefulWidget {
  static const String routeName = '/category-search';
  final String category;
  final String query;
  const MyCategorySearch({
    Key? key,
    required this.category,
    required this.query,
  }) : super(key: key);

  @override
  State<MyCategorySearch> createState() => _MyCategorySearchState();
}

class _MyCategorySearchState extends State<MyCategorySearch> {
  final HomeServices homeServices = HomeServices();
  List<Product>? products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllSeachProduct();
  }

  fetchAllSeachProduct() async {
    products = await homeServices.searchCategoryProducts(
        context: context, category: widget.category, query: widget.query);
        setState(() {
          
        });
  }

        void navigateToSearchScreen(String query) {
      Navigator.pushNamed(context, MySearchScreen.routeName,arguments: query);
    }

    void navigateToCategorySearchScreen(String query) {
   // print(query);
    Navigator.pushNamed(context, MyCategorySearch.routeName,
        arguments: [widget.category,query]);
  }

    void navigateToBack(){
      Navigator.pop(context);
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                leading: InkWell(
                  onTap: navigateToBack,
                  child:Icon(Icons.arrow_back_ios_new_outlined)),
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
                      Expanded(
                        child: Container(
                            height: 42,
                            margin: const EdgeInsets.only(left: 5),
                            child: Material(
                              borderRadius: BorderRadius.circular(7),
                              elevation: 1,
                              child: TextFormField(
                                onFieldSubmitted: navigateToCategorySearchScreen,
                                decoration: InputDecoration(
                                  hintText: 'Search in ${widget.category}',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {},
                                    child: const Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Icon(
                                        Icons.select_all_rounded,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  prefixIcon: InkWell(
                                    onTap: () {},
                                    child: const Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Icon(
                                        Icons.search_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 42,
                        margin: const EdgeInsets.only(left: 8, right: 5),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.black,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body:products == null
        ? const MyLoader()
        :  Column(
              children: [
                const MyAddressBox(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context,index){
                    return MySeachProduct(product: products![index]);
                  }),
                )
              ],
            ),
          );
  }
}
