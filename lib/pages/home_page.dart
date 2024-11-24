import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_project/models/product_model.dart';
import 'package:pos_project/widgets/product_widgets.dart' as pw;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "All Menu";

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(now);

    // Filter products based on selected category
    List<Product> filteredProducts = selectedCategory == "All Menu"
        ? products
        : products
            .where((product) => product.category == selectedCategory)
            .toList();

    return SingleChildScrollView(
      child: Stack(
        children: [
          // Banner Section
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/banner.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Have A Nice Day!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
            
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.7,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildCategoryItem(
                      icon: Icons.restaurant,
                      label: 'All Menu',
                    ),
                    _buildCategoryItem(icon: Icons.coffee, label: 'Coffee'),
                    _buildCategoryItem(icon: Icons.local_drink, label: 'Non Coffee'),
                    _buildCategoryItem(icon: Icons.fastfood, label: 'Snack'),
                  ],
                ),
                const SizedBox(height: 20),

                // Product List Section
                const Text(
                  "Menu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return pw.ProductWidget(product: filteredProducts[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({required IconData icon, required String label}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: selectedCategory == label ? Colors.brown : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: selectedCategory == label ? Colors.white : Colors.brown, size: 22),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: selectedCategory == label ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
