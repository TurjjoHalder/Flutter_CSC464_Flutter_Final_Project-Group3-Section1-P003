import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String formatDate(Timestamp? timestamp) {
    if (timestamp == null) return 'Unknown Date';
    DateTime date = timestamp.toDate();
    return "${date.day}/${date.month}/${date.year} at ${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }


Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'placed':
        return Colors.orange;
      case 'shipped':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }