import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/order_settings/order_settings_controller.dart';
import 'package:vendors_app/styles/text_styles.dart';

class OrderSettingsView extends StatelessWidget {
  OrderSettingsView({super.key});

  final controller = Get.put(OrderSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        label: 'Order Settings',
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Close orders time',
                  style: mediumHeadingTextStyle(),
                ),
                GestureDetector(
                  onTap: () => controller.showTimePickerSheet(context),
                  child: Text(
                    (controller.timeOfDay != null)
                        ? controller.timeOfDay!.format(context)
                        : '12:00',
                    style: mediumHeadingTextStyle(primaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
