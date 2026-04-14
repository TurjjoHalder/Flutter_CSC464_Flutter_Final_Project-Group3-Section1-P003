import 'package:flutter/material.dart';
import 'screens.dart';

import 'package:mini_shopping_cart/widgets/widgets.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});
  final DummyProducts dummyProducts = DummyProducts();

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
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SearchBar(
                    
                    leading: const Icon(Icons.search),
                    trailing: [Icon(Icons.mic)],
                    hintText: 'Search...',
                    onChanged: (value) {
                      // Filter your list here
                      print(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          // Inside your main Column children:
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: GridView.builder(
                itemCount: dummyProducts.products.length, // Number of products
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards per row
                  childAspectRatio: 0.75, // Adjust this to fix card height/width ratio
                  // crossAxisSpacing: 1,
                  // mainAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  return ProductCardWidget(
                    name: dummyProducts.products[index].name,
                    description: dummyProducts.products[index].description,
                    price: dummyProducts.products[index].price,
                    imageUrl: dummyProducts.products[index].imageUrl,
                  );
                },
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
