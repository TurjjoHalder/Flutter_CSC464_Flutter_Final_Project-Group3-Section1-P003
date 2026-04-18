// To parse this JSON data, do
//
//     final productDataModel = productDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<ProductDataModel> productDataModelFromJson(String str) => List<ProductDataModel>.from(json.decode(str).map((x) => ProductDataModel.fromJson(x)));

String productDataModelToJson(List<ProductDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDataModel {
    String productId;
    String name;
    double price;
    String category;
    String imageUrl;
    String description;

    ProductDataModel({
        required this.productId,
        required this.name,
        required this.price,
        required this.category,
        required this.imageUrl,
        required this.description,
    });

    factory ProductDataModel.fromFirestore(DocumentSnapshot doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return ProductDataModel(
        productId: data["productId"], //?? doc.id, // Grab the unique Firestore ID: doc.id
        name: data["name"] ?? 'Unknown Name',
        price: (data["price"] ?? 0).toDouble(), // Safely handles ints/doubles
        category: data["category"] ?? 'Uncategorized',
        imageUrl: data["imageUrl"] ?? '',
        description: data["description"] ?? '',
      );
    }

    factory ProductDataModel.fromJson(Map<String, dynamic> json) => ProductDataModel(
        productId: json["productId"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        category: json["category"],
        imageUrl: json["imageUrl"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "price": price,
        "category": category,
        "imageUrl": imageUrl,
        "description": description,
    };
}
