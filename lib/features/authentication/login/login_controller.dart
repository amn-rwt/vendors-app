import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/features/authentication/login/login_view.dart';
import 'package:vendors_app/features/home/home_view.dart';

class LoginController extends GetxController {
  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  RxBool isLoading = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future loginWithEmailAndPassword() async {
    isLoading.value = !isLoading.value;
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) {
      isLoading.value = !isLoading.value;
      Get.offAll(() => HomeView(uid: value.user!.uid));
    });
    // isLoading.value = !isLoading.value;
  }

  static void logout() {
    log('here');
    FirebaseAuth.instance.signOut().then((value) => Get.to(const LoginView()));
  }

  static void signout() {
    log('singout');
    Get.to(const LoginView());
  }
}
