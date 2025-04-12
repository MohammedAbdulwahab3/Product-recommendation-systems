import 'package:ecommerce_flutter_app/provider/provider.dart';
import 'package:ecommerce_flutter_app/widgets/associated_products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          'Detail',
          style: GoogleFonts.majorMonoDisplay(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['name'],
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(product['image'], fit: BoxFit.cover),
              ),
              Text(product['description'],
                  style: GoogleFonts.montserrat(
                      fontSize: 13, fontWeight: FontWeight.bold)),
              Text("\$${product['price']}",
                  style: GoogleFonts.montserrat(
                      fontSize: 20, color: Colors.deepPurple)),
              SizedBox(height: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(product);
                },
                icon: Icon(Icons.add_shopping_cart),
                label: Text(
                  "Add to Cart",
                  style: GoogleFonts.montserrat(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Associated Products',
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              AssociatedProducts(
                category: product['category'],
                productId: product['id'],
              )
            ],
          ),
        ),
      ),
    );
  }
}
