import 'dart:convert';

import 'package:attic_mobile/types/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartProvider with ChangeNotifier {
  Map<String, int> _cartItems = {}; // <productId, quantity>

  _syncCart() async {
    print('Syncing cart...');
    // final response = await http.post(
    //   Uri.parse('https://api.example.com/cart'),
    //   body: json.encode(_cartItems),
    //   headers: {'Content-Type': 'application/json'},
    // );

    // if (response.statusCode == 200) {
    //   print('Cart synced successfully');
    // } else {
    //   print('Failed to sync cart');
    // }
  }

  /// Adds product to cart and syncs with server. If sync fails, reverts the changes.
  addToCart(String id) async {
    if (_cartItems.containsKey(id)) {
      _cartItems[id] = _cartItems[id]! + 1;
    } else {
      _cartItems[id] = 1;
    }

    notifyListeners();

    try {
      await _syncCart();
    } catch (e) {
      print(e);

      if (_cartItems[id]! > 1) {
        _cartItems[id] = _cartItems[id]! - 1;
      } else {
        _cartItems.remove(id);
      }
    }
  }

  /// Removes product from cart and syncs with server. If sync fails, reverts the changes.
  removeFromCart(String id) async {
    if (_cartItems.containsKey(id)) {
      if (_cartItems[id]! > 1) {
        _cartItems[id] = _cartItems[id]! - 1;
      } else {
        _cartItems.remove(id);
      }
    }

    notifyListeners();

    try {
      await _syncCart();
    } catch (e) {
      print(e);

      if (_cartItems.containsKey(id)) {
        _cartItems[id] = _cartItems[id]! + 1;
      } else {
        _cartItems[id] = 1;
      }
    }
  }
}
