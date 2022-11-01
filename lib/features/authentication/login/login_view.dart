import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/large_button.dart';
import 'package:vendors_app/components/textfield.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/authentication/login/login_controller.dart';

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
              onPressed: () =>
                  log(controller.loginWithEmailAndPassword().toString()),
            ),
            const SizedBox(height: 20),
            const Text(
              'Register?',
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
