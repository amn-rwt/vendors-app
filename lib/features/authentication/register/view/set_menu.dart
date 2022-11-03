import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/appbar.dart';
import 'package:vendors_app/components/large_button.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/constants/value_constants.dart';
import 'package:vendors_app/features/authentication/register/view/add_food_items.dart';
import 'package:vendors_app/styles/text_styles.dart';

class SetMenuView extends StatefulWidget {
  final String uid;
  const SetMenuView({super.key, required this.uid});

  @override
  State<SetMenuView> createState() => _SetMenuViewState();
}

class _SetMenuViewState extends State<SetMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(label: 'Set', leading: true),
      backgroundColor: scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: ExpansionTile(
                            maintainState: true,
                            title: Text(daysOfWeek[index],
                                style: mediumTextStyle()),
                            initiallyExpanded: (index == 0) ? true : false,
                            children: [
                              GridView.builder(
                                itemCount: 1,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  // crossAxisSpacing: 4,
                                ),
                                itemBuilder: (context, index) =>
                                    (index == 1 - 1)
                                        ? Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () => Get.to(
                                                    () => AddFoodItemsView()),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  color: primaryColor,
                                                  child: const Icon(Icons.add,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              (true)
                                                  ? Text(
                                                      'Add items',
                                                      style: smallTextStyle(
                                                          Colors.blue),
                                                    )
                                                  : Text(
                                                      'Add more',
                                                      style: smallTextStyle(
                                                          Colors.blue),
                                                    ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Tooltip(
                                                showDuration: const Duration(
                                                    milliseconds: 400),
                                                waitDuration: const Duration(
                                                    milliseconds: 100),
                                                message: 'tooltip item name',
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'name',
                                                style: smallTextStyle(),
                                              ),
                                            ],
                                          ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: 6, // * No of expansion tiles
                    ),
                    const SizedBox(height: 20),
                    LargeButton(
                        label: 'Next',
                        onPressed: () {
                          //* add menu data
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
