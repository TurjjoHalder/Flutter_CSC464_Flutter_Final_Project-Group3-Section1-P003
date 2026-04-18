import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_shopping_cart/models/order_data_model.dart';
import 'package:mini_shopping_cart/utils/constant.dart';

class OrderManegmentRepo {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> createOrder(OrderDataModel orderData) async {
    try {
      DocumentReference docRef = firestore.collection(MyAppConstants.orderCollection).doc();
      // Assign the generated ID to the order object before saving
      // Note: This assumes your toJson includes the 'id' field
      Map<String, dynamic> data = orderData.toJson();
      data['orderId'] = docRef.id; 

      await docRef.set(data);
      
      return true;
    } catch (e) {
      print("Error adding order: $e");
      return false;
    }
  }
  
}