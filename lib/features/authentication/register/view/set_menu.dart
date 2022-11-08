import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/components/components.dart';

import 'package:vendors_app/constants/value_constants.dart';
import 'package:vendors_app/features/authentication/register/controller.dart/set_menu_controller.dart';
import 'package:vendors_app/features/authentication/register/view/add_food_items.dart';
import 'package:vendors_app/features/home/home_view.dart';
import 'package:vendors_app/styles/text_styles.dart';

class SetMenuView extends StatefulWidget {
  final String uid;
  const SetMenuView({super.key, required this.uid});

  @override
  State<SetMenuView> createState() => _SetMenuViewState();
}

class _SetMenuViewState extends State<SetMenuView> {
  @override
  void initState() {
    log('here');
    super.initState();
  }

  final controller = Get.put(SetMenuController());
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
                        String day = daysOfWeek[index];
                        return FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('vendors')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('menu')
                              .doc(day)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const CupertinoActivityIndicator();
                            }
                            Map<String, dynamic> data =
                                (snapshot.data!.data() != null)
                                    ? snapshot.data!.data()
                                        as Map<String, dynamic>
                                    : {};

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
                                    itemCount: (data['items'] == null ||
                                            data['items'].isEmpty)
                                        ? 1
                                        : data['items'].length + 1,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      // crossAxisSpacing: 4,
                                    ),
                                    itemBuilder: (context, index) => (data
                                                .entries.isEmpty ||
                                            index == data['items'].length)
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
                                              (data.entries.isEmpty ||
                                                      data['items'].length == 0)
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
                                                textAlign: TextAlign.center,
                                                showDuration: const Duration(
                                                    milliseconds: 400),
                                                waitDuration: const Duration(
                                                    milliseconds: 100),
                                                message: data['items'][index]
                                                    .toString(),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                data['items'][index].toString(),
                                                style: smallTextStyle(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: daysOfWeek.length,
                    ),
                    const SizedBox(height: 20),
                    LargeButton(
                      label: 'Next',
                      onPressed: () {
                        Get.to(() => HomeView());
                      },
                    ),
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
