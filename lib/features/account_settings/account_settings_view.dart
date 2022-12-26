import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/styles/text_styles.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        label: 'Account Settings',
        leading: true,
      ),
      body: Text(
        FirebaseAuth.instance.currentUser!.uid,
        style: mediumHeadingTextStyle(Colors.white),
      ),
    );
  }
}
