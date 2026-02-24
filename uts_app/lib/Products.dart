import 'package:flutter/material.dart';
import 'Profile.dart';

const List<Product> products = [
  Product(
    name: 'Shoe',
    description: 'Comfortable shoes',
    price: 49.99,
  ),
  Product(
    name: 'T-Shirt',
    description: 'Soft cotton',
    price: 19.99,
  ),
  Product(
    name: 'Headphones',
    description: 'Noise-cancelling',
    price: 99.99,
  ),
];

class Product {
  final String name;
  final String description;
  final double price;

  const Product({
    required this.name,
    required this.description,
    required this.price,
  });
}
class ProductsScreen extends StatelessWidget {
  final String username;

  const ProductsScreen({super.key, required this.username});

  void _showPurchased(BuildContext context, Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Purchased ${product.name}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        backgroundColor: const Color(0xFF7B4C81),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(username: username),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final product = products[index];
          return _ProductCard(
            product: product,
            onBuy: () => _showPurchased(context, product),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: products.length,
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onBuy;

  const _ProductCard({required this.product, required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF9E4AB0), Color(0xFFF15E9B)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(Icons.shopping_bag, color: Color(0xFF6E288E)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product.description,
                  style: const TextStyle(color: Color.fromARGB(167, 255, 255, 255)),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ElevatedButton(
                onPressed: onBuy,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA00F),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  minimumSize: const Size(0, 28),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textStyle: const TextStyle(fontSize: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Buy'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
