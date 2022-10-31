import 'package:flutter/material.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/button_theme_and_styles.dart';

class LargeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const LargeButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: activeButtonStyle(),
        child: Text(label),
      ),
    );
  }
}
