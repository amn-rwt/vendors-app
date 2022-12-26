import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendors_app/components/components.dart';

class TestView1 extends StatelessWidget {
  const TestView1({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> stream = FirebaseFirestore.instance
        .collection('vendors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('menu')
        .doc('Monday')
        .snapshots();

    log(stream.toString());
    return Scaffold(body: Container());
  }
}
