import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ntp/ntp.dart';
import 'package:vendors_app/test/test_controller.dart';

import '../constants/value_constants.dart';

class TestView1 extends StatelessWidget {
  TestView1({super.key});

  final controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: Text('${controller.now!.weekday}'),
        child: Text(daysOfWeek[controller.now!.weekday - 2]),
      ),
    );
  }
}
