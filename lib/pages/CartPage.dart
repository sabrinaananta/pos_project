import 'package:flutter/material.dart';
import 'historypage.dart';

// Daftar transaksi global
List<Map<String, dynamic>> transactionHistory = [];

class CartPage extends StatefulWidget {
  final String productTitle;
  final String selectedSize;
  final String selectedSweetness;
  final String selectedIceCube;
  final int quantity;
  final int totalPrice;
  final String notes;
  final String productImage;

  const CartPage({
    Key? key,
    required this.productTitle,
    required this.selectedSize,
    required this.selectedSweetness,
    required this.selectedIceCube,
    required this.quantity,
    required this.totalPrice,
    required this.notes,
    required this.productImage,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  // Function to increase quantity
  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Function to decrease quantity
  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  // Calculate total price
  int calculateTotalPrice() {
    return widget.totalPrice * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Product image and details
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                // Product image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.productImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                // Product details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Size: ${widget.selectedSize}'),
                      Text('Sweetness: ${widget.selectedSweetness}'),
                      Text('Ice: ${widget.selectedIceCube}'),
                      if (widget.notes.isNotEmpty)
                        Text('Notes: ${widget.notes}'),
                    ],
                  ),
                ),
                // Price
                Text(
                  'IDR ${calculateTotalPrice()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Quantity selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _decreaseQuantity,
                icon: const Icon(Icons.remove),
              ),
              Text(
                '$quantity',
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                onPressed: _increaseQuantity,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const Divider(),
          // Final total price
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'IDR ${calculateTotalPrice()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Checkout button
          ElevatedButton(
            onPressed: () {
              // Simpan transaksi ke daftar global
              transactionHistory.add({
                'transactionId': DateTime.now().millisecondsSinceEpoch.toString(),
                'productTitle': widget.productTitle,
                'quantity': quantity,
                'totalPrice': calculateTotalPrice(),
                'date': DateTime.now().toIso8601String(),
              });

              // Navigasi ke halaman riwayat transaksi
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransactionHistoryPage(),
                ),
              );
            },
            child: const Text('Proceed to Checkout'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.brown,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
