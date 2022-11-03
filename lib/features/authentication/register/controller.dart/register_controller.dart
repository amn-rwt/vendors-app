import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vendors_app/features/authentication/register/view/add_details.dart';
import 'package:vendors_app/features/authentication/register/view/set_menu.dart';
import 'package:vendors_app/model/menu.dart';
import 'package:vendors_app/model/vendor.dart';
import 'package:vendors_app/services/cloud_firestore_services.dart';
import 'package:vendors_app/services/firebase_auth_services.dart';

class RegisterController extends GetxController {
  RxBool loader = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController resturantName = TextEditingController();
  TextEditingController pricePerTiffin = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController upiID = TextEditingController();
  TextEditingController password = TextEditingController();

  RxString authErrorMessage = ''.obs;

  Future<void> registerUser(String email, String password) async {
    final authResult =
        await FirebaseAuthServices.registerVendor(email, password);
    if (authResult.contains('email-already-in-use')) {
      authErrorMessage.value = 'email-already-in-use';
    } else if (authResult.contains('weak-password')) {
      authErrorMessage.value = 'weak-password';
    } else if (authResult.contains('invalid-email')) {
      authErrorMessage.value = 'invalid-email';
    } else if (authResult.contains('something-went-wrong')) {
      authErrorMessage.value = 'something-went-wrong';
    } else {
      Get.to(() => AddDetails(uid: authResult, email: email));
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
    CloudFirestoreServices.addUser(vendor);
    Get.to(() => SetMenuView(uid: uId));
  }

  Future getFoodItemsList() async {
    final CollectionReference firebaseFirestore =
        FirebaseFirestore.instance.collection('foodItems');
    var foodItems = firebaseFirestore
        .get()
        .then((value) => log(value.docs.length.toString()));
  }
}
