import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/features/settings/settings_controller.dart';
import '../order_settings/order_settings_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        label: 'Settings',
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            const CustomListTile(
              label: 'About',
            ),
            CustomListTile(
              label: 'Order Settings',
              onTap: () => Get.to(
                () => const OrderSettingsView(),
              ),
            ),
            CustomListTile(
              label: 'Logout',
              onTap: controller.logout,
            )
          ],
        ),
      ),
    );
  }
}
