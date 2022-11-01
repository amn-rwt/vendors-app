import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<String> loginWithEmailAndPassword() async {
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
    return user.user!.uid;
  }
}
