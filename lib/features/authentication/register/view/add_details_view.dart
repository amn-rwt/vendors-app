import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/large_button.dart';
import 'package:vendors_app/components/textfield.dart';
import 'package:vendors_app/constants/value_constants.dart';
import 'package:vendors_app/features/authentication/register/controller.dart/register_controller.dart';

class AddDetailsView extends StatelessWidget {
  final String uid;
  const AddDetailsView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextfield(
              controller: controller.resturantName,
              hintText: 'ResName',
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.phone,
              hintText: 'Phone',
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.upiID,
              hintText: 'UPI',
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.pricePerTiffin,
              hintText: 'Price',
              prefixText: ruppeSymbol,
            ),
            const SizedBox(height: 50),
            LargeButton(
              label: 'Next',
              onPressed: () {}, // * register model and move to next screen
            )
          ],
        ),
      ),
    );
  }
}
