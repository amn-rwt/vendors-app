import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/features/authentication/login/login_view.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(
              () => (controller.authErrorMessage.isNotEmpty)
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.authErrorMessage.value,
                        style: smallTextStyle(Colors.red),
                      ),
                    )
                  : const SizedBox(),
            ),
            CustomTextfield(
              controller: controller.email,
              hintText: 'Email',
            ),
            CustomTextfield(
              controller: controller.password,
              hintText: 'Password',
              isObsecure: true,
            ),
            const SizedBox(height: 25),
            Obx(
              () => LargeButton(
                label: 'REGISTER',
                isLoading: controller.loader.value,
                onPressed: () => {
                  controller.loader.value = !controller.loader.value,
                  controller
                      .registerUser(
                        controller.email.text,
                        controller.password.text,
                      )
                      .then((value) =>
                          controller.loader.value = !controller.loader.value),
                },
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already a User?  ',
                    style: smallTextStyle(),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(const LoginView()),
                    text: 'Login',
                    style: const TextStyle(
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
