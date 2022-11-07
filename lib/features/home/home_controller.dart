import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vendors_app/features/authentication/register/view/add_food_items.dart';
import 'package:vendors_app/model/menu.dart';

class HomeController extends GetxController {
  String day = 'Monday';
  @override
  void onInit() {
    log('onInit');
    getTodaysMenu();
    super.onInit();
  }

  @override
  void onReady() {
    log('onReady');
    super.onReady();
  }

  RxBool isMenuUpdated = false.obs;
  RxBool isMenuLoaded = false.obs;

  Menu? menuData;

  Future getTodaysMenu() async {
    DocumentSnapshot menu = await FirebaseFirestore.instance
        .collection('vendors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('menu')
        .doc(day)
        .get();

    menuData = Menu.fromSnapshot(menu.data() as Map<String, dynamic>);

    log(menuData!.day);
    log(menuData!.items.toString());

    isMenuLoaded.value = !isMenuLoaded.value;

    return menuData;
  }

  void updateMenu() {
    Get.to(AddFoodItemsView(day: 'Friday'));
  }
}
