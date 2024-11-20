import 'package:flutter/material.dart';

class Product {
  final String title;
  final String image;
  final int price;
  final String category;
  final int available;
  final int sold;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.category,
    required this.available,
    required this.sold,
  });

  

  // Method to format price
  String get formattedPrice {
    return "IDR ${price.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
  }
}

// Sample product list
final List<Product> products = [
  Product(
    title: "Coffee Brown Sugar",
    image: "assets/images/coffee_brown_sugar.jpg",
    price: 28000,
    category: "Coffee",
    available: 100,
    sold: 50,
  ),
  Product(
    title: "Coffee Caramel Latte",
    image: "assets/images/coffee_caramel_latte.jpg",
    price: 32000,
    category: "Coffee",
    available: 80,
    sold: 30,
  ),
  Product(
    title: "Coffee Latte",
    image: "assets/images/coffee_latte.jpg",
    price: 30000,
    category: "Coffee",
    available: 120,
    sold: 70,
  ),
  Product(
    title: "Americano",
    image: "assets/images/americano.jpg",
    price: 18000,
    category: "Coffee",
    available: 50,
    sold: 25,
  ),
  Product(
    title: "Cappuccino",
    image: "assets/images/cappucino.jpg",
    price: 30000,
    category: "Coffee",
    available: 100,
    sold: 30,
  ),
  Product(
    title: "Espresso",
    image: "assets/images/espresso.jpg",
    price: 15000,
    category: "Coffee",
    available: 25,
    sold: 5,
  ),
  Product(
    title: "Macchiato",
    image: "assets/images/macchiato.jpg",
    price: 30000,
    category: "Coffee",
    available: 30,
    sold: 8,
  ),
  Product(
    title: "Vanilla Latte",
    image: "assets/images/vanilla_latte.jpg",
    price: 35000,
    category: "Coffee",
    available: 80,
    sold: 28,
  ),
  Product(
    title: "Caramel Macchiato",
    image: "assets/images/caramel_macchiato.jpg",
    price: 40000,
    category: "Coffee",
    available: 40,
    sold: 4,
  ),
  Product(
    title: "Hazelnut Cappuccino",
    image: "assets/images/hazelnut_cappucino.jpg",
    price: 35000,
    category: "Coffee",
    available: 45,
    sold: 0,
  ),
  Product(
    title: "Signature Affogato",
    image: "assets/images/signature_affogato.jpg",
    price: 30000,
    category: "Coffee",
    available: 45,
    sold: 0,
  ),
  Product(
    title: "FlatWhite",
    image: "assets/images/flatwhite.jpg",
    price: 25000,
    category: "Coffee",
    available: 30,
    sold: 5,
  ),
  Product(
    title: "Mocha",
    image: "assets/images/mocha.jpg",
    price: 30000,
    category: "Coffee",
    available: 33,
    sold: 4,
  ),
  Product(
    title: "Flavoured Latte",
    image: "assets/images/flavoured_latte.jpg",
    price: 35000,
    category: "Coffee",
    available: 45,
    sold: 20,
  ),
  Product(
    title: "Matcha Latte",
    image: "assets/images/matcha_latte.jpg",
    price: 32000,
    category: "Non Coffee",
    available: 60,
    sold: 20,
  ),
  Product(
    title: "Thaitea Latte",
    image: "assets/images/thaitea_latte.jpg",
    price: 25000,
    category: "Non Coffee",
    available: 80,
    sold: 20,
  ),
  Product(
    title: "Flavoured Milk",
    image: "assets/images/flavoured_milk.jpg",
    price: 25000,
    category: "Non Coffee",
    available: 40,
    sold: 10,
  ),
  Product(
    title: "Salted Caramel ",
    image: "assets/images/ice_salted_caramel.jpg",
    price: 28000,
    category: "Non Coffee",
    available: 60,
    sold: 15,
  ),
  Product(
    title: "Chocolate Mint ",
    image: "assets/images/chocolate_mint.jpg",
    price: 22000,
    category: "Non Coffee",
    available: 50,
    sold: 10,
  ),
  Product(
    title: "lemon tea",
    image: "assets/images/lemontea.jpg",
    price: 17000,
    category: "Non Coffee",
    available: 55,
    sold: 10,
  ),
  Product(
    title: "Chocolate",
    image: "assets/images/chocolate.jpg",
    price: 22000,
    category: "Non Coffee",
    available: 90,
    sold: 40,
  ),
  Product(
    title: "Ice Tea",
    image: "assets/images/tea.jpg",
    price: 15000,
    category: "Non Coffee",
    available: 70,
    sold: 35,
  ),
  Product(
    title: "Sparkling Water",
    image: "assets/images/sparkling.jpg",
    price: 12000,
    category: "Non Coffee",
    available: 40,
    sold: 15,
  ),
  Product(
    title: "Croissant",
    image: "assets/images/croissant.jpg",
    price: 10000,
    category: "Snack",
    available: 150,
    sold: 60,
  ),
  Product(
    title: "Cookies",
    image: "assets/images/cookies.jpg",
    price: 12000,
    category: "Snack",
    available: 110,
    sold: 50,
  ),
  Product(
    title: "Donut",
    image: "assets/images/donut.jpg",
    price: 15000,
    category: "Snack",
    available: 80,
    sold: 30,
  ),
  Product(
    title: "Macaron",
    image: "assets/images/macaron.jpg",
    price: 20000,
    category: "Snack",
    available: 70,
    sold: 20,
  ),
  Product(
    title: "Sandwich",
    image: "assets/images/sandwich.jpg",
    price: 25000,
    category: "Snack",
    available: 60,
    sold: 20,
  ),
  Product(
    title: "Muffin",
    image: "assets/images/muffin.jpg",
    price: 16000,
    category: "Snack",
    available: 50,
    sold: 15,
  ),
  Product(
    title: "French Fries",
    image: "assets/images/frenchfries.jpg",
    price: 24000,
    category: "Snack",
    available: 50,
    sold: 5,
  ),
  Product(
    title: "Onion Ring",
    image: "assets/images/onionring.jpg",
    price: 22000,
    category: "Snack",
    available: 40,
    sold: 15,
  ),
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Categories section
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.7,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildCategoryItem(
                    context: context, icon: Icons.restaurant, label: 'All Menu'),
                _buildCategoryItem(
                    context: context, icon: Icons.coffee, label: 'Coffee'),
                _buildCategoryItem(
                    context: context, icon: Icons.local_drink, label: 'Non-Coffee'),
                _buildCategoryItem(
                    context: context, icon: Icons.fastfood, label: 'Snack'),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
      {required BuildContext context,
      required IconData icon,
      required String label}) {
    return GestureDetector(
      onTap: () {
        _onCategorySelected(context, label);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _onCategorySelected(BuildContext context, String category) {
    List<Product> filteredProducts = category == 'All Menu'
        ? products
        : products.where((product) => product.category == category).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProductListScreen(products: filteredProducts, category: category),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products;
  final String category;

  ProductListScreen({required this.products, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.image, width: 50, height: 50),
            title: Text(product.title),
            subtitle: Text(product.formattedPrice),
          );
        },
      ),
    );
  }
}
