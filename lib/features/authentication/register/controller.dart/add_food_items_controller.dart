import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vendors_app/model/menu.dart';

import '../../../home/home_controller.dart';

class AddFoodItemsController extends GetxController {
  final homeController = Get.put(HomeController());

  RxBool isLoading = true.obs;
  List<FoodItem> foodItems = [];

  RxList? selectedItems;

  void addItems(String item) {
    selectedItems!.contains(item)
        ? selectedItems!.remove(item)
        : selectedItems!.add(item);
  }

  @override
  onInit() {
    selectedItems = homeController.menuData!.items.obs;
    getFoodItems();
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  Future getFoodItems() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('foodItems').get();

    foodItems = snapshot.docs
        .map((doc) => FoodItem(
            imageUrl: doc['imageUrl'], name: doc['name'], docId: doc.id))
        .toList();

    isLoading.value = !isLoading.value;
  }

  Future setMenuForDay(String day) async {
    log(selectedItems.toString());
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('vendors')
        .doc(user!.uid)
        .collection('menu')
        .doc(day)
        .set(Menu(day: day, items: selectedItems!).toMap());
  }
}
