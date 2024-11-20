import 'package:flutter/material.dart';
import 'package:pos_project/models/product_model.dart';
import 'package:pos_project/pages/Order_page.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  void addToCart(Product product) {
    // Logika untuk menambahkan produk ke keranjang belanja.
    // Ini bisa berupa pemanggilan fungsi di provider atau state management lain.
    print('${product.title} added to cart');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10), // Spacing between product boxes
      padding: const EdgeInsets.all(10), // Internal padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10), // Spacing between image and details

          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                // Price with "/bagian" text
                Row(
                  children: [
                    Text(
                      product.formattedPrice, // Use the formatted price
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(width: 5), // Spacing between price and "/bagian"
                    const Text(
                      '/bagian',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                // Availability and Sold count
                Text(
                  'Available: ${product.available}  |  Sold: ${product.sold}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // Add to cart button
          IconButton(
  icon: const Icon(Icons.add),
  color: Colors.black,
  onPressed: () {
    // Navigasi ke halaman order
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(product: product), 
      ),
    );
  },
),
        ],
      ),
    );
  }
}
