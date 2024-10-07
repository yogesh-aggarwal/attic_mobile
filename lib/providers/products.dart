import 'dart:convert';

import 'package:attic_mobile/types/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

int counter = 0;

class ProductsProvider with ChangeNotifier {
  final Map<String, Product> _products = {};

  List<Product> getRandProducts(int count) {
    if (_products.isEmpty) return [];

    return List.generate(count, (_) {
      return _products.values.toList()[++counter % _products.length];
    });
  }

  void fetchProducts() async {
    final res = await http.get(
      Uri.parse("http://localhost:3000/v1/product/all"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    final json = jsonDecode(res.body);

    final products =
        json["data"].map<Product>((x) => Product.fromMap(x)).toList();
    for (final product in products) {
      _products[product.id] = product;
    }

    notifyListeners();
  }
}
