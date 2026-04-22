import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/product_data_model.dart';
import 'package:mini_shopping_cart/providors/cart_manegment_provider.dart';

class CartItemWidget extends StatefulWidget {
  final CartProvider cartProvider;
  final CartItem cartItem;
  final ProductDataModel product;
  const CartItemWidget({super.key, required this.cartProvider, required this.cartItem, required this.product});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Product Image
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(widget.product.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Product Name and Price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${widget.product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Quantity Controls (+, -, and count)
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.redAccent,
                  ),
                  onPressed: () =>
                      widget.cartProvider.decrementItem(widget.product.productId),
                ),
                Text(
                  '${widget.cartItem.quantity}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () => widget.cartProvider.incrementItem(widget.product),
                ),
                // Remove Entirely Button
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.grey),
                  onPressed: () => widget.cartProvider.removeItem(widget.product.productId),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
