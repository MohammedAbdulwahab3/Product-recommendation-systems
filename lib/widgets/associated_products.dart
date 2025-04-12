import 'dart:convert';
import 'package:ecommerce_flutter_app/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssociatedProducts extends StatefulWidget {
  final String category;
  final String productId;

  const AssociatedProducts({
    super.key,
    required this.category,
    required this.productId,
  });

  @override
  State<AssociatedProducts> createState() => _AssociatedProductsState();
}

class _AssociatedProductsState extends State<AssociatedProducts> {
  late Future<List<Map<String, dynamic>>> _associatedProducts;

  Future<List<Map<String, dynamic>>> fetchAssociatedProducts() async {
    final url =
        'https://your-api-url.com/products?category=${widget.category}'; // Update to your actual API URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .where((product) => product['id'].toString() != widget.productId)
          .cast<Map<String, dynamic>>()
          .toList();
    } else {
      throw Exception('Failed to load associated products');
    }
  }

  @override
  void initState() {
    super.initState();
    _associatedProducts = fetchAssociatedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _associatedProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final associated = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: associated.length,
            itemBuilder: (context, index) {
              final product = associated[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(product: product),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
