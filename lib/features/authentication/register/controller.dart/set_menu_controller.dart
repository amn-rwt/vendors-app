import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vendors_app/model/menu.dart';

class SetMenuController extends GetxController {
  List<Menu> listOfMenu = [];

  addItemToDay(String day, FoodItem item) {
    listOfMenu.add(Menu(day: day, items: []));
  }

  CollectionReference menu = FirebaseFirestore.instance
      .collection('vendors')
      .doc('') // uid
      .collection('menu');

  Future setMenu(List<FoodItem> items, String day) async {
    menu.doc(day).set(items);
  }
}
