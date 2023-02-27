import 'dart:convert';

import 'package:amazon_clone/common/Widgets/utills.dart';
import 'package:amazon_clone/costants/error_handling.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddressServices {
  void saveUserAddress({
    required BuildContext context,
    required String Address,
  }) async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      http.Response res =
          await http.post(Uri.parse('$url/api/save-user-address'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'x-auth-token': user.token,
              },
              body: jsonEncode({
                'address': Address,
              }));

      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: () {
            User userAddress =
                user.copyWith(address: jsonDecode(res.body)['address']);
            Provider.of<UserProvider>(context, listen: false)
                .setUserByUserModel(userAddress);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void placrOrder({
    required BuildContext context,
    required String Address,
    required double totalSum,
  }) async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      http.Response res = await http.post(Uri.parse('$url/api/order'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': user.token,
          },
          body: jsonEncode({
            'cart': user.cart,
            'totalPrice': totalSum,
            'address': Address,
          }));

      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Your order has been placed!');
            User users = user.copyWith(
              cart: [],
            );
            Provider.of<UserProvider>(context, listen: false)
                .setUserByUserModel(users);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
