import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static Future<String> registerVendor(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      } else if (e.code == 'invalid-email') {
        return 'invalid-email';
      }
    } catch (e) {
      return 'somethings-went-wrong';
    }
    return 'something-went-wrong';
  }

  static Future login(String email, String password) async {
    String uid = '';
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => uid = value.user!.uid);
    return uid;
  }

  static Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
