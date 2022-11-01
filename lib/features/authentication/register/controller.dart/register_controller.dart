import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vendors_app/features/authentication/register/view/add_details.dart';
import 'package:vendors_app/model/menu.dart';
import 'package:vendors_app/model/vendor.dart';
import 'package:vendors_app/services/cloud_firestore_services.dart';
import 'package:vendors_app/services/firebase_auth_services.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController resturantName = TextEditingController();
  TextEditingController pricePerTiffin = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController upiID = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    final authResult =
        await FirebaseAuthServices.registerVendor(email, password);
    if (authResult.contains('email-already-in-use')) {
      log('email-invalid');
    } else if (authResult.contains('weak-password')) {
      log('weak-password');
    } else if (authResult.contains('something-went-wrong')) {
      log('something-went-wrong');
    } else {
      Get.to(AddDetails(uid: authResult, email: email));
    }
  }

  Future<void> addDetails(String name, String email, String resturantName,
      int pricePerTiffin, String phone, String upiID, String uId) async {
    final Vendor vendor = Vendor(
      uId: uId,
      name: name,
      resturantName: resturantName,
      pricePerTiffin: pricePerTiffin,
      phone: phone,
      email: email,
      upiID: upiID,
    );
    CloudFirestoreServices.addUser(vendor)
        .then((result) => log('$email kdflk'));
  }

  final CollectionReference firebaseFirestore =
      FirebaseFirestore.instance.collection('foodItems');

  // final foodItem = FoodItem(imageUrl: imageUrl, name: name)
}
