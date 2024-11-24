import 'package:flutter/material.dart';
import 'package:pos_project/models/product_model.dart';
import 'package:pos_project/pages/CartPage.dart';
import 'package:badges/badges.dart' as badges;


int cartItemCount = 0; // Counter jumlah item di keranjang


class OrderPage extends StatefulWidget {
  final Product product;

  const OrderPage({Key? key, required this.product}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String selectedSize = "Regular";
  String selectedSweetness = "Normal Sweet";
  String selectedIceCube = "Normal Ice";
  int quantity = 1;
  String notes = "";

  // Fungsi untuk menghitung harga berdasarkan pilihan dan kuantitas
  int calculatePrice() {
    int price = widget.product.price;
    if (selectedSize == "Large") {
      price += 5000;
    }
    return price * quantity;
  }

  // Fungsi untuk membuat kotak pilihan
  Widget buildOptionBox({
    required String option,
    required String groupValue,
    required Function(String) onTap,
    String? additionalInfo,
  }) {
    bool isSelected = option == groupValue;
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = (screenWidth - 60) / 3;

    return GestureDetector(
      onTap: () => onTap(option),
      child: Container(
        width: boxWidth,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown : Colors.white,
          border: Border.all(color: Colors.brown),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              option,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (additionalInfo != null)
              Text(
                additionalInfo,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.brown,
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isSnack = widget.product.category == 'Snack';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true,
        actions: [
          badges.Badge(
            badgeContent: Text(
              '$cartItemCount',
              style: const TextStyle(color: Colors.white),
            ),
            showBadge: cartItemCount > 0,
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CartPage(
      productTitle: widget.product.title,
      selectedSize: selectedSize,
      selectedSweetness: selectedSweetness,
      selectedIceCube: selectedIceCube,
      quantity: quantity,
      totalPrice: calculatePrice(),
      notes: notes,
      productImage: widget.product.image,  
    ),
  ),
);

              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.product.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Price per item:',
            style: TextStyle(fontSize: 14, color: Colors.brown),
          ),
          const SizedBox(height: 20),
          if (isSnack) ...[
            const Text(
              "Add Notes (Optional):",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  notes = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Enter your notes here...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
          ] else ...[
            const Text(
              "Choose Cup Size:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: [
                buildOptionBox(
                  option: "Regular",
                  groupValue: selectedSize,
                  onTap: (value) => setState(() => selectedSize = value),
                ),
                buildOptionBox(
                  option: "Large",
                  groupValue: selectedSize,
                  onTap: (value) => setState(() => selectedSize = value),
                  additionalInfo: "+5000",
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Choose Sweetness Level:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: [
                buildOptionBox(
                  option: "Normal Sweet",
                  groupValue: selectedSweetness,
                  onTap: (value) => setState(() => selectedSweetness = value),
                ),
                buildOptionBox(
                  option: "Less Sweet",
                  groupValue: selectedSweetness,
                  onTap: (value) => setState(() => selectedSweetness = value),
                ),
                buildOptionBox(
                  option: "No Sweet",
                  groupValue: selectedSweetness,
                  onTap: (value) => setState(() => selectedSweetness = value),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Choose Ice Cube Level:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: [
                buildOptionBox(
                  option: "Normal Ice",
                  groupValue: selectedIceCube,
                  onTap: (value) => setState(() => selectedIceCube = value),
                ),
                buildOptionBox(
                  option: "Less Ice",
                  groupValue: selectedIceCube,
                  onTap: (value) => setState(() => selectedIceCube = value),
                ),
                buildOptionBox(
                  option: "No Ice",
                  groupValue: selectedIceCube,
                  onTap: (value) => setState(() => selectedIceCube = value),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              Text(
                'IDR ${calculatePrice()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
  onPressed: () {
    // Mengupdate cart item count
    setState(() {
      cartItemCount++;
    });

    // Notifikasi bahwa item telah ditambahkan ke keranjang
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item added to cart!')),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.brown,
    foregroundColor: Colors.white,
  ),
  child: const Text('Add to Cart'),
),



        ],
      ),
    );
  }
}
