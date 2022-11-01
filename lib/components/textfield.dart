import 'package:flutter/material.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/text_styles.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  final String? prefixText;
  final TextInputType? textInputType;
  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixText,
      this.textInputType = TextInputType.text,
      this.isObsecure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        obscureText: isObsecure,
        style: textfieldTextStyle(),
        decoration: InputDecoration(
          prefixText: prefixText,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: lightTextColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
