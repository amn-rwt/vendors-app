import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SetMenuController extends GetxController {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  void getMenu(String day) {
    final Future<DocumentSnapshot> menu = FirebaseFirestore.instance
        .collection('vendors')
        .doc(uid) // uid
        .collection('menu')
        .doc(day)
        .get();

    log(menu.toString());
  }
}
