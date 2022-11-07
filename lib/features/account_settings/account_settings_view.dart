import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendors_app/components/components.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        label: 'Account Settings',
        leading: true,
      ),
    );
  }
}
