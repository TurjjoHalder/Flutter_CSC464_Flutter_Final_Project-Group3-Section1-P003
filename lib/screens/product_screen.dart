
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/product_data_model.dart';
import 'package:mini_shopping_cart/providors/cart_manegment_provider.dart';
import 'package:mini_shopping_cart/utils/constant.dart';
import 'package:mini_shopping_cart/widgets/product_card_widget.dart';
import 'package:provider/provider.dart';
import 'screens.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Welcome to Mini Shopping Cart'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShoppingCart()),
              );
            },
            icon: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Badge(
                  label: Text('${cartProvider.totalItems}'),
                  isLabelVisible: cartProvider.totalItems > 0,
                  child: const Icon(Icons.shopping_cart_outlined),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // const SizedBox(height: ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: StreamBuilder(
                stream: firestore.collection(MyAppConstants.productCollection).snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading products'));
                  }

                  final productDocs = snapshot.data?.docs ?? [];
                  if (productDocs.isEmpty) {
                    return const Center(child: Text('No products available'));
                  }
                  
                  return GridView.builder(
                    itemCount: productDocs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      final product = ProductDataModel.fromFirestore(productDocs[index]);
                      
                      return Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          final int quantity = cartProvider.getQuantity(product.productId);

                          return ProductCardWidget(
                            product: product, 
                            quantity: quantity,
                            onIncrement: () => cartProvider.incrementItem(product),
                            onDecrement: () => cartProvider.decrementItem(product.productId),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}