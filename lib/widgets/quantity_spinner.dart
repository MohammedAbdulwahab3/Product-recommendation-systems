import 'package:flutter/material.dart';

class QuantitySpinner extends StatefulWidget {
  const QuantitySpinner({super.key});

  @override
  _QuantitySpinnerState createState() => _QuantitySpinnerState();
}

class _QuantitySpinnerState extends State<QuantitySpinner> {
  int quantity = 1;

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Increment Button
        IconButton(
          icon: Icon(Icons.arrow_drop_up, size: 20),
          onPressed: _increment,
          padding: EdgeInsets.zero, // Remove extra padding
        ),

        // Display Quantity
        Text(
          '$quantity',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),

        // Decrement Button
        IconButton(
          icon: Icon(Icons.arrow_drop_down, size: 20),
          onPressed: _decrement,
          padding: EdgeInsets.zero, // Remove extra padding
        ),
      ],
    );
  }
}
