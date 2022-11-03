import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItem {
  final String name;
  final String imageUrl;
  FoodItem({required this.imageUrl, required this.name});
}
