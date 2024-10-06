import 'dart:convert';

import 'package:attic_mobile/types/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

int counter = 0;

final Product product = Product.fromMap({
  "_id": "66e6af48a33d768383063509",
  "title": "5 Pink Oriental Lilies in Glass Vase",
  "images": [
    "https://storage.googleapis.com/florence-preeesha.appspot.com/https%3A//www.fnp.com/images/pr/x/v20221005085013/5-pink-oriental-lilies-in-glass-vase_1.jpg",
    "https://storage.googleapis.com/florence-preeesha.appspot.com/https%3A//www.fnp.com/images/pr/x/v20221005085014/5-pink-oriental-lilies-in-glass-vase_2.jpg",
    "https://storage.googleapis.com/florence-preeesha.appspot.com/https%3A//www.fnp.com/images/pr/x/v20221006185100/5-pink-oriental-lilies-in-glass-vase_3.jpg",
    "https://storage.googleapis.com/florence-preeesha.appspot.com/https%3A//www.fnp.com/images/pr/x/v20221006185317/5-pink-oriental-lilies-in-glass-vase_4.jpg",
    "https://storage.googleapis.com/florence-preeesha.appspot.com/https%3A//www.fnp.com/images/pr/x/v20221006185317/5-pink-oriental-lilies-in-glass-vase_5.jpg",
    "https://storage.googleapis.com/florence-preeesha.appspot.com/https%3A//www.fnp.com/images/pr/x/v20221006185317/5-pink-oriental-lilies-in-glass-vase_6.jpg"
  ],
  "price": 1957.0,
  "metadata": {
    'createdBy': "",
    'createdAt': 0,
    'editedAt': 0,
    'editedBy': "",
    'isEdited': false,
    'isActive': true,
    'isDeleted': false,
  },
  "details": {
    "stock": 261,
    "tags": ["Romance", "Anniversary", "Celebration", "Sympathy", "Birthday"],
    "categories": [
      "Romance",
      "Anniversary",
      "Celebration",
      "Sympathy",
      "Birthday"
    ],
    "description": [
      {"type": "para", "content": "Product Details:"},
      {
        "type": "list",
        "content": [
          "5 Pink Color Oriental Lilies",
          "White Color Gypsophila Gypsy Fillers",
          "FNP Branded Ribbon Black",
          "Transparent Cylindrical Glass Vase 4x8 Inch",
          "Green Message Card",
          "Off White Lock String Card"
        ]
      },
      {"type": "para", "content": "Flowers Trivia:"},
      {
        "type": "list",
        "content": [
          "Lilies are found in a variety of places across the world, including Canada, the USA, India, Japan, Australia and most European countries. In fact, lilies are one of the most prevalent flowers in Europe, with many choosing to display them in both their homes and gardens.",
          "Lilies are said to be one of the top ten flowers in the world, which means they a popular choice for bouquets and centerpieces."
        ]
      },
      {
        "type": "list",
        "content": ["Country of Origin: India"]
      }
    ],
    "deliveryInfo": [
      {
        "type": "list",
        "content": [
          "The image displayed is indicative in nature.",
          "Actual product may vary in shape or design as per the availability.",
          "Flowers may be delivered in fully bloomed, semi-bloomed or bud stage.",
          "The chosen delivery time is an estimate and depends on the availability of the product and the destination to which you want the product to be delivered.",
          "Since flowers are perishable in nature, we will be able to attempt delivery of your order only once.",
          "The delivery cannot be redirected to any other address.",
          "This product is hand delivered and will not be delivered along with courier products.",
          "Occasionally, substitution of flowers is necessary due to temporary and/or regional unavailability issues."
        ]
      }
    ],
    "careInstructions": [
      {
        "type": "list",
        "content": [
          "Don’t place the flower arrangement under direct sunlight or near any other source of excessive heat.",
          "It should also not be placed under a fan.",
          "If any petal gets damaged, then remove it from the flower.",
          "Please change the water whenever required.",
          "All the flowers benefit from a daily mist of water.",
          "Enjoy your flowers!"
        ]
      }
    ]
  },
  "stats": {"views": 0, "rating": 4.5, "reviewsCount": 8},
  "costing": {
    "originalPrice": 2249.0,
    "sellingPrice": 1957.0,
    "discountInPercent": 13.0,
    "baseDeliveryCharges": 32.0,
  }
});

class ProductsProvider with ChangeNotifier {
  List<Product>? _products = List.generate(100, (_) => product);

  List<Product> getRandProducts(int count) {
    return List.generate(count, (_) {
      return _products![++counter % _products!.length];
    });
  }

  void fetchProducts() async {
    final res = await http.get(
      Uri.parse("http://localhost:3000/v1/product/all"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': await getJWTtoken(),
      },
    );

    final json = jsonDecode(res.body);

    final products = json["data"];
    _products = products.map<Product>((x) => Product.fromMap(x)).toList();

    notifyListeners();
  }
}
