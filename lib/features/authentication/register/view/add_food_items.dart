import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/components.dart';
import '../../../../model/menu.dart';
import '../controller.dart/add_food_items_controller.dart';

class AddFoodItemsView extends StatelessWidget {
  AddFoodItemsView({super.key});

  final controller = Get.put(AddFoodItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(label: 'Add Items'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
                stream: controller.foodItems,
                builder: (context, snapshot) {
                  List foodItems = snapshot.data!.docs
                      .map((doc) => FoodItem(
                          docId: doc.id,
                          imageUrl: doc['imageUrl'],
                          name: doc['name']))
                      .toList();
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: foodItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 6,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller.addItems(foodItems[index].docId);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: (controller.selectedItems.value
                                          .contains(foodItems[index].docId))
                                      ? Border.all(
                                          width: 4,
                                          color: Colors.green,
                                        )
                                      : const Border(),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // child: Image.network(imageUrl),
                              ),
                            ),
                          ),
                          Text(foodItems[index].name),
                        ],
                      );
                    },
                  );
                }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LargeButton(
                label: 'Add Items',
                // onPressed: () {},
                onPressed: () {
                  controller.setMenuForDay('Wednesday').then(
                    (value) {
                      Get.back();
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
