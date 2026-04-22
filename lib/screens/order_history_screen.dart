import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/order_data_model.dart';
import 'package:mini_shopping_cart/providors/order_manegment_provider.dart';
import 'package:mini_shopping_cart/widgets/widgets.dart';
import 'package:provider/provider.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  // The currently selected filter
  String _selectedStatus = 'All';

  // The list of statuses you want to filter by
  final List<String> _statusFilters = [
    'All',
    'placed',
    'shipped',
    'delivered',
    'cancelled'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          FilterBarWidget(selectedStatus: _selectedStatus, statusFilters: _statusFilters, onStatusSelected: (status) {
            setState(() {
              _selectedStatus = status;
            });
          }),

          // The Order List
          Expanded(
          child: Consumer<OrderManegmentProvider>(
            builder: (context, orderProvider, child) {
              // 1. Check loading state from the provider
              if (orderProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              // 2. Get the clean list of OrderDataModel objects
              final allOrders = orderProvider.orders;
              // 3. Apply the local filter directly to the Dart objects!
              final filteredOrders = _selectedStatus == 'All'
                  ? allOrders
                  : allOrders.where((order) => order.status == _selectedStatus).toList();

              if (filteredOrders.isEmpty) {
                return const Center(
                  child: Text('No orders found here.', style: TextStyle(fontSize: 16)),
                );
              }
              // 4. Build the list
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  // This is now a clean OrderDataModel object, not a Firestore document!
                  final OrderDataModel order = filteredOrders[index];

                  // Pass the ENTIRE object to your widget
                  return OrderDetails(
                    order: order, 
                  );
                },
              );
            },
          ),
        ),
        ],
      ),
    );
  }
}