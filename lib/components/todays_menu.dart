import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/compact_button.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/button_theme_and_styles.dart';
import 'package:vendors_app/styles/text_styles.dart';

import '../features/authentication/register/view/add_food_items.dart';

class TodaysMenu extends StatefulWidget {
  final String day;
  final List menuItems;
  const TodaysMenu({super.key, required this.day, required this.menuItems});

  @override
  State<TodaysMenu> createState() => _TodaysMenuState();
}

class _TodaysMenuState extends State<TodaysMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.menuItems.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => (index ==
                      widget.menuItems.length)
                  ? Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: primaryColor,
                          ),
                          child: IconButton(
                            onPressed: () =>
                                Get.to(() => AddFoodItemsView(day: widget.day)),
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
                          widget.menuItems[index],
                          style: mediumTextStyle(),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
            ),
          ),
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
