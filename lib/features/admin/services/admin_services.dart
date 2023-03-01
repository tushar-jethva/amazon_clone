import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/common/Widgets/utills.dart';
import 'package:amazon_clone/costants/error_handling.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/features/admin/model/sales.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
    required VoidCallback onSuccess,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final clodinary = CloudinaryPublic('diarrqynw', 'tgqozbcc');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await clodinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);

      http.Response res = await http.post(Uri.parse('$url/admin/add-Product'),
          body: product.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': user.token,
          });

      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: onSuccess
          );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get all products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    List<Product> productList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$url/admin/get-products'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': user.token,
      });
      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response res = await http.post(
        Uri.parse(
          '$url/admin/delete-product',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token,
        },
        body: jsonEncode({"id": product.id}),
      );
      httpErrorHandled(res: res, context: context, onSuccess: onSuccess);
    } catch (e) {
      showSnackBar(context, "Product Deleted!");
    }
  }

  Future<List<Order>> fetchAllOrders({
    required BuildContext context,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    List<Order> orderList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$url/admin/orders'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': user.token,
      });

      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: () {
            for (var i = 0; i < jsonDecode(res.body).length; i++) {
              orderList
                  .add(Order.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void changeOrderStatus({
    required BuildContext context,
    required int steps,
    required Order order,
    required VoidCallback onSuccess,
  }) async {
    final users = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response res = await http.post(
        Uri.parse('$url/admin/order-status'),
        // headers: <String, String>{
        //   'Content-Type': 'application/json charset=UTF-8',
        //   'x-auth-token': user.token,
        // }
        // ,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': users.token,
        },
        body: jsonEncode({
          "id": order.id,
          "status": steps,
        }),
      );

      httpErrorHandled(res: res, context: context, onSuccess: onSuccess);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<Map<String, dynamic>> getEarnings({
    required BuildContext context,
  }) async {
    final users = Provider.of<UserProvider>(context, listen: false).user;
    List<Sales> sales = [];
    int totalEarnings = 0;
    try {
      http.Response res = await http
          .get(Uri.parse('$url/admin/analytics'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': users.token,
      });
      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: () {
            var response = jsonDecode(res.body);
            totalEarnings = response['total'];
            sales = [
              Sales('Mobiles', response['mobileEarnings']),
              Sales('Essentials', response['essentialsEarnings']),
              Sales('Appliances', response['appliancesEarnings']),
              Sales('Books', response['booksEarnings']),
              Sales('Fashion', response['fashionEarnings']),
            ];
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return {
      'sales': sales,
      'totalEarnings': totalEarnings,
    };
  }
}
