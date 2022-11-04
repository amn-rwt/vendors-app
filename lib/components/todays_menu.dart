import 'package:flutter/material.dart';
import 'package:vendors_app/components/compact_button.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/button_theme_and_styles.dart';
import 'package:vendors_app/styles/text_styles.dart';

class TodaysMenu extends StatefulWidget {
  final int itemCount;
  final List menuItems;
  const TodaysMenu({super.key, required this.itemCount, required this.menuItems});

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
              itemCount: widget.itemCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => (index == widget.itemCount - 1)
                  ? Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: primaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {},
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
                        Text('name', style: mediumTextStyle())
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 20),
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CompactButton(
                label: 'Close Orders',
                onPressed: () {},
                buttonStyle: dangerButtonStyle(),
              ),
              const SizedBox(
                width: 10,
              ),
              // TODO: logic to show this button only on adding new items.
              CompactButton(
                label: 'Update',
                onPressed: () {},
                buttonStyle: activeButtonStyle(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
