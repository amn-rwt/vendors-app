import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/settings/settings_view.dart';
import 'package:vendors_app/styles/text_styles.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String label;
  final bool? leading;
  final bool? trailing;
  const CustomAppbar(
      {super.key,
      required this.label,
      this.leading = false,
      this.trailing = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: scaffoldBackgroundColor,
      elevation: 0,
      leadingWidth: 52,
      centerTitle: true,
      leading: (leading == true)
          ? Container(
              margin: const EdgeInsets.only(top: 4, left: 4),
              padding: const EdgeInsets.only(left: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            )
          : const SizedBox(),
      actions: [
        (trailing == true)
            ? Container(
                margin: const EdgeInsets.all(4),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () => Get.to(() => const SettingsView()),
                  // onPressed: () => log('here'),
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black87,
                  ),
                ))
            : const SizedBox(),
      ],
      title: Text(
        label,
        style: largeHeadingTextStyle(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
