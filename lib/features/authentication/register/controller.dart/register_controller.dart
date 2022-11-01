import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

  Future<void> registerUser(String name, String email, String resturantName,
      String password, int pricePerTiffin, String phone, String upiID) async {
    final userCredentials =
        FirebaseAuthServices.registerVendor(email, password);
    final Vendor vendor = Vendor(
      // userID: userCredentials,
      name: name,
      resturantName: resturantName,
      pricePerTiffin: pricePerTiffin,
      phone: phone,
      email: email,
      upiID: upiID,
    );
    CloudFirestoreServices.addUser(vendor).then((value) => value.toString());
  }
}
