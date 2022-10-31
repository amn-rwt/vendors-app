import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static Future<UserCredential> registerVendor(String email, String password) async {
    final UserCredential userCredential;
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}
