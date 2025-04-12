import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Map<String, dynamic>> _products = [];

  List<Map<String, dynamic>> get products => _products;

  Future<void> fetchProducts() async {
    final url = "https://f826-35-204-36-166.ngrok-free.app/prdict";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        _products = data
            .map((item) => {
                  "name": item["name"],
                  "category": item["category"],
                  "image": item["image"],
                  "description": item["description"],
                  "price": item["price"].toDouble(),
                })
            .toList();

        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}
