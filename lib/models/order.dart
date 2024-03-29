// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amazon_clone/models/product.dart';

class Order {
  final String id;
  final double totalPrice;
  final String address;
  final String userId;
  final int orderAt;
  final int status;
  final List<Product> products;
  final List<int> quantity;
  Order({
    required this.id,
    required this.totalPrice,
    required this.address,
    required this.userId,
    required this.orderAt,
    required this.status,
    required this.products,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'totalPrice': totalPrice,
      'address': address,
      'userId': userId,
      'orderAt': orderAt,
      'status': status,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
    };
  }

  // factory Order.fromMap(Map<String, dynamic> map) {
  //   return Order(
  //     id: map['_id'] as String,
  //     totalPrice: map['totalPrice'].toDouble() as double,
  //     address: map['address'] as String,
  //     userId: map['userId'] as String,
  //     orderAt: map['orderAt'].toDouble() as double,
  //     status: map['status'] as int,
  //     products: List<Product>.from(map['products']?.map((x)=>Product.fromJson(x['product']))),
  //     quantity: List<int>.from((map['products']?.map((x)=> x['quantity']) as List<int>),
  //     )
  //   );
  // }

    factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] ?? '',
      products: List<Product>.from(
          map['products']?.map((x) => Product.fromMap(x['product']))),
      quantity: List<int>.from(
        map['products']?.map(
          (x) => x['quantity'],
        ),
      ),
      address: map['address'] ?? '',
      userId: map['userId'] ?? '',
      orderAt: map['orderAt']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
