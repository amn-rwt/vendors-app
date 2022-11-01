import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  // static Future<String> registerVendor(String email, String password) async {
  //   final UserCredential userCredential;
  //   userCredential = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password);
  //   return userCredential.user!.uid;
  // };
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
      }
    } catch (e) {
      return 'somethings-went-wrong';
    }
    return 'something-went-wrong';
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
