import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/features/home/home_view.dart';
import '../controller.dart/add_food_items_controller.dart';

class AddFoodItemsView extends StatelessWidget {
  final String day;
  AddFoodItemsView({super.key, required this.day});

  final controller = Get.put(AddFoodItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(label: 'Add Items'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => (controller.isLoading.value)
                  ? const Center(child: CupertinoActivityIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.foodItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.addItems(
                                      controller.foodItems[index].docId);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: (controller.selectedItems!.contains(
                                            controller.foodItems[index].docId))
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
                            Text(name),
                          ],
                        );
                      },
                    ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LargeButton(
                  label: 'Add Items',
                  onPressed: () {
                    controller.setMenuForDay(day).then(
                      (value) {
                        Get.off(HomeView());
                        controller.homeController.getTodaysMenu();
                        controller.homeController.isMenuLoaded.value =
                            !controller.homeController.isMenuLoaded.value;
                      },
                    );
                  }),
            )
          ],
        ));
  }
}
