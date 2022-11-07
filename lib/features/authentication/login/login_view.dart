import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/authentication/login/login_controller.dart';
import 'package:vendors_app/features/authentication/register/view/register_view.dart';
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
            CustomTextfield(
              controller: controller.password,
              hintText: 'Password',
              isObsecure: true,
            ),
            const SizedBox(height: 30),
            Obx(
              () => LargeButton(
                isLoading: controller.isLoading.value,
                label: 'Login',
                onPressed: () => controller.loginWithEmailAndPassword(),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don\'t have a account?  ',
                    style: smallTextStyle(),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(RegisterView()),
                    text: 'Register',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
