
import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/order_data_model.dart';
import 'package:mini_shopping_cart/utils/helper_method.dart';

class OrderDetails extends StatefulWidget {
  final OrderDataModel
  order; // Pass the entire order data model instead of individual fields
  const OrderDetails({super.key, required this.order});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // Collapsed View (Main Card)
        title: Text(
          "Order ID: ${widget.order.orderId.substring(0, 12)}", // Shows a shortened ID
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(formatDate(widget.order.createdAt)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$${widget.order.total.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              widget.order.status.toUpperCase(),
              style: TextStyle(
                color: getStatusColor(widget.order.status),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),

        // Expanded View (Customer Details & Items)
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Customer Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 8),
                    Text(widget.order.customerName),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16),
                    const SizedBox(width: 8),
                    Text(widget.order.customerPhone),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 8),
                    Expanded(child: Text(widget.order.customerAddress)),
                  ],
                ),
                const SizedBox(height: 15),

                const Text(
                  "Items Ordered",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                // Loop through the items array
                ...widget.order.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item.quantity}x ${item.name}",
                        ),
                        Text(
                          "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
