import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vendors_app/model/menu.dart';
import 'package:vendors_app/test/test_controller.dart';
import 'package:vendors_app/test/test_view_two.dart';

class TestView1 extends StatelessWidget {
  TestView1({super.key});

  final controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('vendors')
                .doc('TBZhXzqFG5fpgMlWwKFqSdJVLH73')
                .collection('menu')
                .doc('Monday')
                .snapshots(),
            builder: (context, snapshot) {
              // var data = snapshot.data!.data()!.map((key, value) => null);
              // log(data.toString());
              return Container();
            }));
  }
}
