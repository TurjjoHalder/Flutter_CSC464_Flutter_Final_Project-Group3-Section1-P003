import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/product_data_model.dart';

// A tiny helper class to bundle the product and its quantity
class CartItem {
  final ProductDataModel product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartProvider extends ChangeNotifier {
  // Now stores { productId : CartItem }
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get totalItems {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  // NEW: Auto Total Calculation!
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  int getQuantity(String productId) {
    return _items.containsKey(productId) ? _items[productId]!.quantity : 0;
  }

  // Notice we now pass the whole ProductDataModel here!
  void incrementItem(ProductDataModel product) {
    if (_items.containsKey(product.productId)) {
      _items[product.productId]!.quantity += 1;
    } else {
      _items[product.productId] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void decrementItem(String productId) {
    if (!_items.containsKey(productId)) return;
    
    if (_items[productId]!.quantity > 1) {
      _items[productId]!.quantity -= 1;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  // NEW: Remove item entirely
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // NEW: Clear all cart items
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}