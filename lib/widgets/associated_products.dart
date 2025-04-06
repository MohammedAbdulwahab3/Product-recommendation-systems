import 'package:ecommerce_flutter_app/pages/detail_page.dart';
import 'package:ecommerce_flutter_app/components/list_of_products.dart';
import 'package:flutter/material.dart';

class AssociatedProducts extends StatelessWidget {
  const AssociatedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        itemCount: latestProducts.length,
        itemBuilder: (context, index) {
          final latest = latestProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(product: latest)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(latest['image']), fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
