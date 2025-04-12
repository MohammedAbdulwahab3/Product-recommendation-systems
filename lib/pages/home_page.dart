import 'package:ecommerce_flutter_app/pages/cart_page.dart';
import 'package:ecommerce_flutter_app/pages/search_detail_page.dart';
import 'package:ecommerce_flutter_app/widgets/category_list.dart';
import 'package:ecommerce_flutter_app/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_flutter_app/widgets/product_grid.dart';
import 'package:ecommerce_flutter_app/widgets/quantity_spinner.dart';
import 'package:ecommerce_flutter_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  String searchText = '';

  List<Map<String, dynamic>> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  void filterProducts() {
    final allProducts =
        Provider.of<ProductProvider>(context, listen: false).products;

    setState(() {
      displayedProducts = allProducts.where((product) {
        final matchesCategory = selectedCategory == 'All' ||
            product['category'] == selectedCategory;
        final matchesSearch =
            product['name'].toLowerCase().contains(searchText.toLowerCase());
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<ProductProvider>(context).categories;

    // final productProvider = Provider.of<ProductProvider>(context);
    // final allProducts = productProvider.products;

    // // Handle loading state
    // if (allProducts.isEmpty) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    // // Run filter if not yet set
    // if (displayedProducts.isEmpty) {
    //   displayedProducts = allProducts;
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.grey.shade100,
              title: Text(
                'Ecommerce ',
                style: GoogleFonts.majorMonoDisplay(
                    fontSize: 23, fontWeight: FontWeight.bold),
              ),
              pinned: true,
              floating: false,
              expandedHeight: 60,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Find Your Product',
                    style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        onSearch: (value) {
                          setState(
                            () {
                              searchText = value;
                              filterProducts();
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    QuantitySpinner(),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade300,
                          // focusColor: Colors.deepPurple,
                          foregroundColor: Colors.white),
                      icon: Icon(Icons.search_rounded),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchDetailPage()));
                      },
                    )
                  ],
                ),
                SizedBox(height: 12),
                // Text(
                //   'Recommended',
                //   style: GoogleFonts.montserrat(
                //       fontSize: 15, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 100, child: LatestProducts()),
                SizedBox(height: 10),
                CategoryList(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                      filterProducts();
                    });
                  },
                ),
                SizedBox(height: 10),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ProductGrid(products: displayedProducts)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
