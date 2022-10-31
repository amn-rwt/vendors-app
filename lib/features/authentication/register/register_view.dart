import 'package:flutter/material.dart';
import 'package:vendors_app/components/large_button.dart';
import 'package:vendors_app/components/textfield.dart';
import 'package:vendors_app/constants/value_constants.dart';
import 'package:vendors_app/features/authentication/register/controller.dart/register_controller.dart';
import 'package:vendors_app/styles/text_styles.dart';

class RegisterView extends StatelessWidget {
  final RegisterController controller = RegisterController();
  RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextfield(
              controller: controller.name,
              hintText: 'Name',
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.resturantName,
              hintText: 'Resturant Name',
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.email,
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.password,
              hintText: 'Password',
              isObsecure: true,
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.pricePerTiffin,
              hintText: 'Price per tiffin',
              prefixText: ruppeSymbol,
            ),
            const SizedBox(height: 20),
            LargeButton(
                label: 'REGISTER',
                onPressed: () => controller.registerUser(
                    controller.name.text,
                    controller.email.text,
                    controller.resturantName.text,
                    controller.password.text,
                    12,
                    'controller.phone.text',
                    controller.upiID.text)),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already a User?  ',
                    style: smallTextStyle(),
                  ),
                  const TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
