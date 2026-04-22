import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/order_data_model.dart';
import 'package:mini_shopping_cart/providors/cart_manegment_provider.dart';
import 'package:mini_shopping_cart/repository/order_manegment_repo.dart';
import 'package:mini_shopping_cart/utils/coustom_validators.dart';
import 'package:mini_shopping_cart/widgets/core_input_field_widget.dart';

import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.greenAccent,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Order Summary
                    Text(
                      "Order Total: \$${cartProvider.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    const Text("Delivery Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),

                    // Name Field
                    CoreInputFieldWidget(labelText: "Full Name", controller: _nameController, validator: CustomValidators.validateCustomerName),
                    const SizedBox(height: 15),

                    // Phone Field
                    CoreInputFieldWidget(labelText: "Phone Number", controller: _phoneController, validator: CustomValidators.validatePhoneNumber, keyboardType: TextInputType.phone),
                    const SizedBox(height: 15),

                    // Address Field
                    CoreInputFieldWidget(labelText: "Full Address", controller: _addressController, maxLines: 3, validator: CustomValidators.validateAddress),
                    const SizedBox(height: 30),

                    // Place Order Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      // Place Order Logic
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        if (_formKey.currentState!.validate()) {

                          final order = OrderDataModel(
                            orderId: 'Turjjo', // Firestore will generate this
                            customerName: _nameController.text.trim(),
                            customerPhone: _phoneController.text.trim(),
                            customerAddress: _addressController.text.trim(),
                            items: cartProvider.items.values.map((cartItem) => Item(
                              productId: cartItem.product.productId,
                              name: cartItem.product.name,
                              quantity: cartItem.quantity,
                              price: cartItem.product.price,
                            )).toList(),
                            total: cartProvider.totalAmount,
                            status: 'placed',
                            // createdAt will be set by Firestore, so we can leave it null/not need to pass it here.
                          );
                          final orderRepo = OrderManegmentRepo();
                          //make sure to await the order creation to handle success/failure properly
                          
                          final orderCreated = await orderRepo.createOrder(order);
                          if (!orderCreated) {
                            // if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to place order. Please try again.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                            // }
                          }
                          // TODO: Dispose the  controllers after order is placed to free up resources
                          // Clear the cart and show confirmation!
                          cartProvider.clearCart();
                          if (context.mounted) {
                            setState(() => _isLoading = false);
                            // Go back to the Home screen and show a success message
                            Navigator.popUntil(context, (route) => route.isFirst);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Order placed successfully! 🎉'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        }
                        else {
                          setState(() => _isLoading = false);
                          
                        }

                      },
                      child: const Text('Place Order', style: TextStyle(fontSize: 18, color: Colors.black87)),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}