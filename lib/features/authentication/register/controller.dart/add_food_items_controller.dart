import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vendors_app/model/menu.dart';

class AddFoodItemsController extends GetxController {
  RxBool isLoading = true.obs;
  List<FoodItem> foodItems = [];

  @override
  onInit() {
    getFoodItems();
    super.onInit();
  }

  Future<List<FoodItem>> getFoodItems() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('foodItems').get();

    foodItems = snapshot.docs
        .map((doc) => FoodItem(imageUrl: doc['imageUrl'], name: doc['name']))
        .toList();

    isLoading.value = !isLoading.value;

    return foodItems;
  }
}
