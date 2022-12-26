import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/constants/value_constants.dart';
import 'package:vendors_app/features/authentication/register/view/add_food_items.dart';
import 'package:vendors_app/model/menu.dart';
import 'package:vendors_app/services/time_provider.dart';

class HomeController extends GetxController {
  final BuildContext context;
  HomeController({required this.context});

  @override
  void onInit() {
    day;
    super.onInit();
  }

  final name = 'username';

  late String day = daysOfWeek[CurrentTime.of(context)!.weekday - 1];

  late Stream<DocumentSnapshot> todaysMenuStream = FirebaseFirestore.instance
      .collection('vendors')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('menu')
      .doc(day)
      .snapshots();

  final Stream orders = FirebaseFirestore.instance
      .collection('orders')
      .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  void updateMenu() {
    Get.to(AddFoodItemsView(
      day: 'Monday',
    ));
  }
}
