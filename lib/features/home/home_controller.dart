import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vendors_app/model/menu.dart';

class HomeController extends GetxController {
  List<Menu> todaysMenu = [];
  Future getTodaysMenu(String day) async {
    DocumentSnapshot menu = await FirebaseFirestore.instance
        .collection('vendors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('menu')
        .doc(day)
        .get();
    // todaysMenu = menu.data()?.map((doc));
  }
}
