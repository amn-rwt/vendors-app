import 'package:flutter/material.dart';
import 'package:vendors_app/components/components.dart';
import 'package:get/get.dart';
import 'package:vendors_app/constants/value_constants.dart';
import 'package:vendors_app/features/authentication/register/controller.dart/register_controller.dart';

class AddDetails extends StatelessWidget {
  final String uid;
  final String email;
  const AddDetails({super.key, required this.uid, required this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      appBar: const CustomAppbar(label: 'Add Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            CustomTextfield(controller: controller.name, hintText: 'Name'),
            CustomTextfield(controller: controller.phone, hintText: 'Phone'),
            CustomTextfield(
                controller: controller.resturantName,
                hintText: 'Resturant Name'),
            CustomTextfield(
                controller: controller.pricePerTiffin,
                hintText: 'Price per tiffin',
                prefixText: ruppeSymbol),
            CustomTextfield(controller: controller.upiID, hintText: 'UPI Id'),
            const Spacer(),
            LargeButton(
              label: 'Next',
              onPressed: () => controller.addDetails(
                controller.name.text,
                email,
                controller.resturantName.text,
                int.parse(controller.pricePerTiffin.text),
                controller.phone.text,
                controller.upiID.text,
                uid,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
