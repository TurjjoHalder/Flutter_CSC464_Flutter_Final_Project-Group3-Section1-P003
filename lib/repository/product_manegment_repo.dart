// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mini_shopping_cart/firebase_options.dart';
import 'package:mini_shopping_cart/models/product_data_model.dart';
// import 'package:mini_shopping_cart/screens/screens.dart';
import 'package:mini_shopping_cart/utils/constant.dart';


// import 'package:firebase_core/firebase_core.dart';
// import 'package:mini_shopping_cart/data/dummy_products.dart'; 


class ProductManegmentRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Optimized to 1 network request
  Future<void> addProduct(ProductDataModel productData) async {
    try {
      // Create a doc reference first to get the ID
      DocumentReference docRef = firestore.collection(MyAppConstants.productCollection).doc();
      
      // Assign the generated ID to the product object before saving
      // Note: This assumes your toJson includes the 'id' field
      Map<String, dynamic> data = productData.toJson();
      data['productId'] = docRef.id; 

      await docRef.set(data);
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  // Helper to push the whole list
  Future<void> uploadDummyData(List<ProductDataModel> list) async {
    for (var product in list) {
      await addProduct(product);
      print('Uploaded: ${product.name}');
    }
    print('All products uploaded successfully!');
  }
}


// This is just a quick script to upload dummy data. You can run this in a separate Dart file or as part of your main app initialization. Make sure to comment it out after running once to avoid duplicate entries!

// void main() async {
//   // Required to talk to the native Firebase SDKs
//   WidgetsFlutterBinding.ensureInitialized();
  
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   final repo = ProductManegmentRepo();
//   final dummyData = DummyProducts();
  
//   print('Starting upload...');
//   await repo.uploadDummyData(dummyData.products);
//   print('Done!');

//   // Force exit the script so it doesn't hang on an empty screen
//   exit(0); 
// }