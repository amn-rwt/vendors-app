import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSettingsController extends GetxController {
  TimeOfDay? timeOfDay = const TimeOfDay(hour: 12, minute: 00);

  void showTimePickerSheet(BuildContext context) async {
    log('here');
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay!,
    );
    if (pickedTime != null) {
      log('in update func');
      FirebaseFirestore.instance
          .collection('vendors')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'closeOrderTime': pickedTime.format(context),
      }, SetOptions(merge: true)).then((value) => log('updated'));
    }
  }
}
