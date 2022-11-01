import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/large_button.dart';
import 'package:vendors_app/components/textfield.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/authentication/login/login_controller.dart';
import 'package:vendors_app/styles/text_styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            CustomTextfield(
              controller: controller.email,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              controller: controller.password,
              hintText: 'Password',
              isObsecure: true,
            ),
            const SizedBox(height: 30),
            LargeButton(
              label: 'Login',
              onPressed: () => controller.loginWithEmailAndPassword(),
            ),
            const SizedBox(height: 20),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Not a user?  ',
                style: mediumTextStyle(),
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => log('here'),
                  text: 'Login',
                  style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  )),
            ])),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
