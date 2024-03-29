import 'dart:convert';

import 'package:amazon_clone/common/Widgets/utills.dart';
import 'package:amazon_clone/costants/error_handling.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response res = await http.post(
        Uri.parse('$url/api/add-to-cart'),
        body: jsonEncode({
          'id': product.id!,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token,
        },
      );

      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: () {
            User cartuser = user.copyWith(cart: jsonDecode(res.body)['cart']);
            Provider.of<UserProvider>(context, listen: false)
                .setUserByUserModel(cartuser);
            showSnackBar(context, "Added to cart");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response res = await http.post(
        Uri.parse('$url/api/product/rating'),
        body: jsonEncode({
          'id': product.id!,
          'rating': rating,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': user.token,
        },
      );

      httpErrorHandled(res: res, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
