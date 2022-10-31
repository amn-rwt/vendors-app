import 'package:flutter/material.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/button_theme_and_styles.dart';

class CompactButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final String label;
  const CompactButton(
      {super.key, required this.label, required this.buttonStyle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(label),
      ),
    );
  }
}
