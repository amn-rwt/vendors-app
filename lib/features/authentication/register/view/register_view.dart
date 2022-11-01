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
              controller: controller.email,
              hintText: 'Email',
            ),
            CustomTextfield(
              controller: controller.password,
              hintText: 'Password',
              isObsecure: true,
            ),
            const SizedBox(height: 20),
            LargeButton(
                label: 'REGISTER',
                onPressed: () => controller.registerUser(
                      controller.email.text,
                      controller.password.text,
                    )),
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
