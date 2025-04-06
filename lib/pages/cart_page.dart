import 'package:ecommerce_flutter_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: Text("My Cart",
              style: GoogleFonts.majorMonoDisplay(
                  fontSize: 20, fontWeight: FontWeight.bold))),
      body: cart.cartItems.isEmpty
          ? Center(
              child: Text(
              "Your cart is empty!",
              style: GoogleFonts.montserrat(),
            ))
          : ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final product = cart.cartItems[index];
                return ListTile(
                  leading: Image.asset(product['image'], width: 50),
                  title: Text(
                    product['name'],
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "\$${product['price']}",
                    style: GoogleFonts.montserrat(color: Colors.deepPurple),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      cart.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200),
                onPressed: () => cart.clearCart(),
                child: Text(
                  "Checkout (\$${cart.totalPrice})",
                  style: GoogleFonts.montserrat(
                      color: Colors.deepPurple, fontWeight: FontWeight.w600),
                ),
              ),
            )
          : null,
    );
  }
}
