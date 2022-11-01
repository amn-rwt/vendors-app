import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static Future<String> registerVendor(String email, String password) async {
    final UserCredential userCredential;
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  static Future login(String email, String password) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (user) => log(user.user!.uid),
        );
  }

  static Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
