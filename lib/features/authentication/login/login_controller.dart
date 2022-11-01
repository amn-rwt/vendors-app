import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/features/authentication/login/login_view.dart';
import 'package:vendors_app/features/home/home_view.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future loginWithEmailAndPassword() async {
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
    Get.to(HomeView(uid: user.user!.uid));
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
