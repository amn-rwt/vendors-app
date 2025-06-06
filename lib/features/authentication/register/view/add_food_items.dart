import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/text_styles.dart';
import '../../../../model/menu.dart';
import '../controller.dart/add_food_items_controller.dart';

class AddFoodItemsView extends StatelessWidget {
  final String day;
  AddFoodItemsView({super.key, required this.day});

  final controller = Get.put(AddFoodItemsController());

  @override
  Widget build(BuildContext context) {
    log(day);
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
                                          color: primaryColor,
                                        )
                                      : const Border(),
                                  color: containerBackgroundColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // child: Image.network(imageUrl),
                              ),
                            ),
                          ),
                          Text(
                            foodItems[index].name,
                            style: smallTextStyle(color: Colors.white60),
                          ),
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
                  controller.setMenuForDay(day).then(
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
