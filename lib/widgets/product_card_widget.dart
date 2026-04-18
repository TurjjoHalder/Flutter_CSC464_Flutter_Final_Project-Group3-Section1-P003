import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/product_data_model.dart';

class ProductCardWidget extends StatelessWidget {
  // Now it only takes the ProductDataModel and the cart controls
  final ProductDataModel product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl, // Access data through the product object
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: const Color.fromARGB(66, 55, 131, 194),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          product.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Price: \$${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: quantity == 0
                      ? IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 20),
                          onPressed: onIncrement, // Calls the provider via LandingPage
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white, size: 20),
                              onPressed: onDecrement, // Calls the provider via LandingPage
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white, size: 20),
                              onPressed: onIncrement, // Calls the provider via LandingPage
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}