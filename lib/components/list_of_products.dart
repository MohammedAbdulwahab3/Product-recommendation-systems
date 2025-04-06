import 'dart:convert';
import 'package:http/http.dart' as http;

void getList() async {
  final url = Uri.parse("https://f826-35-204-36-166.ngrok-free.app/prdict");

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": "ebrahim"}),
    );

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");
  } catch (e) {
    print("Error: $e");
  }
}

final List<Map<String, dynamic>> products = [
  {
    "name": "SAMSUNG Galaxy A25",
    "category": "Cell phones",
    "image": "assets/images/phone-1.jpg",
    "description":
        "Galaxy A25 5G A Series Cell Phone, 128GB Unlocked Android Smartphone",
    "price": 500.0,
  },

  {
    "name": "SAMSUNG Galaxy S9",
    "category": "Cell phones",
    "image": "assets/images/phone-2.jpg",
    "description":
        "SAMSUNG Galaxy S9 (64GB, 4GB RAM) 5.8, QHD+ Display, IP68 Water Resistance, 3000mAh Battery",
    "price": 147,
  },
  {
    "name": "Apple iPhone 15 Pro",
    "category": "Cell phones",
    "image": "assets/images/phone-3.jpg",
    "description":
        "Apple iPhone 15 Pro, 128GB, Blue Titanium - Verizon (Renewed)",
    "price": 455,
  },
  {
    "name": "Apple iPhone 13 Pro",
    "category": "Cell phones",
    "image": "assets/images/phone-4.jpg",
    "description":
        "Apple iPhone 13 Pro, 256GB, Alpine Green for TracFone (Renewed)",
    "price": 300,
  },
  {
    "name": "Tecno Spark 30C",
    "category": "Cell phones",
    "image": "assets/images/phone-5.jpg",
    "description":
        "2 Pack Tempered Glass Screen Protectors for Tecno Spark 30C 4G Ultra Clear HD Protection",
    "price": 30,
  },
  //Shoes
  {
    "name": "Men's Running Shoe",
    "category": "Shoes",
    "image": "assets/images/shoes-1.jpg",
    "description": "Under Armour Men's Charged Assert 9 Running Shoe",
    "price": 59.9,
  },
  {
    "name": "Men's addidas sneaker",
    "category": "Shoes",
    "image": "assets/images/shoes-2.jpg",
    "description": "adidas Men's Vl Court 3.0 Sneaker",
    "price": 33.5,
  },
  {
    "name": "Women's Chunky High Heels",
    "category": "Shoes",
    "image": "assets/images/shoes-3.jpg",
    "description":
        "Coutgo Womens Chunky High Heels Closed Pointed Toe Ankle Strap Pumps Vintage D'Orsay Dress Party Shoes",
    "price": 45.3,
  },
  {
    "name": "Women's Boot",
    "category": "Shoes",
    "image": "assets/images/shoes-4.jpg",
    "description": "Cobb Hill Wynter Women's Boot",
    "price": 100.1,
  },
  {
    "name": "Men's boot",
    "category": "Shoes",
    "image": "assets/images/shoes-5.jpg",
    "description":
        "Nautica Men's Chukka Boot: Dress Casual Lace-Up Ankle Shoe Oxfords & Desert Boots",
    "price": 70.4,
  },
  //jackets
  {
    "name": "HOOD CREW Men's Casual",
    "category": "Jackets",
    "image": "assets/images/jacket-1.jpg",
    "description":
        "HOOD CREW Men's Casual Stand Collar PU Faux Leather Zip-Up Motorcycle Bomber Jacket With a Removable Hood",
    "price": 59.9,
  },
  {
    "name": "The North Face Men's Flare 2",
    "category": "Jackets",
    "image": "assets/images/jacket-2.jpg",
    "description":
        "The North Face Men's Flare 2 Insulated 550-Down Full Zip Puffer Jacket",
    "price": 134.1,
  },
  {
    "name": "Denim Jacket",
    "category": "Jackets",
    "image": "assets/images/jacket-3.jpg",
    "description": "Guide Gear Quilt-Lined Denim Jacket 2.0",
    "price": 48.9,
  },
  {
    "name": "Women's Softshell Jacket",
    "category": "Jackets",
    "image": "assets/images/jacket-4.jpg",
    "description":
        "Outdoor Ventures Women's Softshell Jacket with Hood Fleece Lined Warm Lightweight Waterproof Insulated Windbreaker",
    "price": 45.5,
  },
  {
    "name": "Women's Denim Cotton jacket",
    "category": "Jackets",
    "image": "assets/images/jacket-5.jpg",
    "description":
        "Women's Denim Cotton Button Closed Long Sleeve Solid Color Jacket With Pockets",
    "price": 32.9,
  },

  //computer
  // {
  //   "name": "Women's Denim Cotton jacket",
  //   "category": "Jackets",
  //   "image": "assets/images/phone-1.jpg",
  //   "description":
  //       "Women's Denim Cotton Button Closed Long Sleeve Solid Color Jacket With Pockets",
  //   "price": 32.9,
  // },
  //Trouser
  //watches
  //jwelleries
];

// Latest products
final List<Map<String, dynamic>> latestProducts = [
  {
    "name": "Samsung Galaxy S24 Ultra",
    "category": "Cell phones",
    "image": "assets/images/latest-1.jpg",
    "description":
        "Samsung Galaxy S24 Ultra Cell Phone, 256GB AI Smartphone, Unlocked Android, 200MP, 100x Zoom Cameras",
    "price": 599,
  },
  {
    "name": "iPhone 15 Pro Max Case",
    "category": "Cell phones",
    "image": "assets/images/latest-2.jpg",
    "description":
        "sTORRAS Magnetic Ostand for iPhone 15 Pro Max Case, [Military Grade Drop Tested][Compatible with MagSafe]",
    "price": 130,
  },
  {
    "name": "Nike Men's Shoes",
    "category": "Shoes",
    "image": "assets/images/latest-3.jpg",
    "description":
        "Nike Lunar Roam Premium Men's Shoes (HV2523-001, Wolf Grey/Cool Grey/Anthracite)",
    "price": 100.9,
  },
  {
    "name": "Denim Jacket Men 2025",
    "category": "Jackets",
    "image": "assets/images/latest-4.jpg",
    "description":
        "Semir Denim Jacket Men 2025 Spring New Vintage Washed Light Workwear Jacket Slightly Loose Lapel Top Fashionable",
    "price": 130,
  },
  {
    "name": "ASUS ROG Strix G16 Gaming Laptop",
    "category": "Computers",
    "image": "assets/images/latest-5.jpg",
    "description":
        "ASUS ROG Strix G16 Gaming Laptop, 165Hz Display, NVIDIA® GeForce RTX™ 4060, Intel Core i7-13650HX, 16GB DDR5, 1TB PCIe Gen4 SSD, Wi-Fi 6E, Windows 11, G614JV-AS74",
    "price": 130,
  },
];
