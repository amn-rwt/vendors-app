import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/compact_button.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/services/time_provider.dart';
import 'package:vendors_app/styles/button_theme_and_styles.dart';
import 'package:vendors_app/styles/text_styles.dart';

import '../features/authentication/register/view/add_food_items.dart';

class TodaysMenu extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TodaysMenu({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    if (snapshot.data == null ||
        !snapshot.data.exists ||
        snapshot.data.data()['items'].isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: containerBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Text('The menu for today has not been set.'),
            CompactButton(
              label: 'Set menu',
              buttonStyle: activeButtonStyle(),
              onPressed: () => Get.to(
                () => AddFoodItemsView(day: CurrentTime.weekday(context)!),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: containerBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Today\'s Menu',
            style: mediumHeadingTextStyle(),
          ),
          const SizedBox(height: 20),
          Flexible(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.data()['items'].length + 1,
                  physics: const NeverScrollableScrollPhysics(),
                  // itemCount: snapshot.data,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                  ),
                  // itemCount: snapshot.data.length,

                  itemBuilder: (context, index) {
                    return (index == snapshot.data.data()['items'].length)
                        ? Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: primaryColor,
                                ),
                                child: IconButton(
                                  onPressed: () =>
                                      Get.to(() => AddFoodItemsView(
                                            day: CurrentTime.weekday(context)!,
                                          )),
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                'Add item',
                                style: mediumTextStyle(),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                snapshot.data['items'][index],
                                style: mediumTextStyle(),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          );
                  })),
          const SizedBox(height: 30),
          Container(
              // child: Label,
              ),
          Align(
            alignment: Alignment.centerRight,
            child: CompactButton(
              label: 'Close Orders',
              onPressed: () {},
              buttonStyle: dangerButtonStyle(),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
