// To parse this JSON data, do
//
//     final orderDataModel = orderDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<OrderDataModel> orderDataModelFromJson(String str) =>
    List<OrderDataModel>.from(
      json.decode(str).map((x) => OrderDataModel.fromJson(x)),
    );

String orderDataModelToJson(List<OrderDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDataModel {
  String orderId;   // TODO: Have to check something here on 22 april morning
  
  String customerName;
  String customerPhone;
  String customerAddress;
  List<Item> items;
  double total;
  String status;
  Timestamp? createdAt;

  OrderDataModel({
    required this.orderId,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.items,
    required this.total,
    required this.status,
    this.createdAt,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) => OrderDataModel(
    orderId: json["orderId"],
    customerName: json["customerName"],
    customerPhone: json["customerPhone"],
    customerAddress: json["customerAddress"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    total: json["total"]?.toDouble(),
    status: json["status"],
    createdAt: json["createdAt"] is String
        ? Timestamp.fromDate(DateTime.parse(json["createdAt"]))
        : (json["createdAt"] as Timestamp),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "customerName": customerName,
    "customerPhone": customerPhone,
    "customerAddress": customerAddress,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "total": total,
    "status": status,
    "createdAt": FieldValue.serverTimestamp(),
  };
}

class Item {
  String productId;
  String name;
  int quantity;
  double price;

  Item({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    productId: json["productId"],
    name: json["name"],
    quantity: json["quantity"],
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "quantity": quantity,
    "price": price,
  };
}
