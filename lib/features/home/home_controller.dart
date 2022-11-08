import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vendors_app/features/authentication/register/view/add_food_items.dart';
import 'package:vendors_app/model/menu.dart';

class HomeController extends GetxController {
  String day = 'Wednesday';

  Stream<DocumentSnapshot> todaysMenuStream = FirebaseFirestore.instance
      .collection('vendors')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('menu')
      .doc('Tuesday')
      .snapshots();

  void updateMenu() {
    Get.to(AddFoodItemsView());
  }
}
