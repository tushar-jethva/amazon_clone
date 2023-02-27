import 'dart:convert';

import 'package:amazon_clone/common/Widgets/utills.dart';
import 'package:amazon_clone/costants/error_handling.dart';
import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AccountServices {
  Future<List<Order>> fetchAllOrders({
    required BuildContext context,
  }) async {
    List<Order> orderList = [];
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response res = await http.get(
          Uri.parse('$url/api/fetch-orders'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': user.token,
          });
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'x-auth-token': user.token,
      // }
      httpErrorHandled(
          res: res,
          context: context,
          onSuccess: () {
            for (var i = 0; i < jsonDecode(res.body).length; i++) {
              orderList.add(Order.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }
}
