import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_shopping_cart/models/order_data_model.dart';
import 'package:mini_shopping_cart/utils/constant.dart';

class OrderManegmentProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<OrderDataModel> _orders = [];
  bool _isLoading = true;

  List<OrderDataModel> get orders => _orders;
  bool get isLoading => _isLoading;

  OrderManegmentProvider() {
    // This starts listening to the Stream the moment the app opens!
    _firestore
        .collection(MyAppConstants.orderCollection)
        .orderBy('createdAt', descending: true)
        .snapshots() // <--- You keep your snapshots!
        .listen((QuerySnapshot snapshot) {
          _orders = snapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            data['orderId'] = data['orderId'] ?? doc.id; // Ensure orderId is set
            return OrderDataModel.fromJson(data);
          }).toList();

          _isLoading = false;
          notifyListeners(); // Tells the UI to redraw instantly when a new order arrives
        });
  }
}
