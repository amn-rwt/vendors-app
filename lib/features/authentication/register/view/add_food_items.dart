import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/appbar.dart';
import '../controller.dart/add_food_items_controller.dart';

class AddFoodItemsView extends StatelessWidget {
  AddFoodItemsView({super.key});

  final controller = Get.put(AddFoodItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(label: 'Add Items'),
        body: Obx(
          () => (controller.isLoading.value)
              ? const Center(child: CupertinoActivityIndicator())
              : GridView.builder(
                  itemCount: controller.foodItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) {
                    final String name = controller.foodItems[index].name;
                    final String imageUrl =
                        controller.foodItems[index].imageUrl;

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {}, // add Item to specific day doc.
                          // onTap: () => controller., //add items to selected items list. and model for specific day.
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.network(imageUrl),
                          ),
                        ),
                        Text(name),
                      ],
                    );
                  },
                ),
        ));
  }
}
