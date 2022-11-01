import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/appbar.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/settings/settings_controller.dart';
import 'package:vendors_app/styles/text_styles.dart';

import '../../components/function_list_tile.dart';

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
              label: 'Logout',
              onTap: controller.logout,
            )
          ],
        ),
      ),
    );
  }
}
