import 'package:flutter/material.dart';
import 'package:vendors_app/constants/color_constants.dart';

ButtonStyle activeButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    elevation: 0,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white,
    ),
  );
}

ButtonStyle dangerButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.grey,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    elevation: 0,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: primaryColor,
    ),
  );
}
