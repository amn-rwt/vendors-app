import 'package:flutter/material.dart';
import 'package:vendors_app/constants/color_constants.dart';

TextStyle largeHeadingTextStyle([Color? color = Colors.white]) {
  return TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

TextStyle mediumHeadingTextStyle([Color? color = Colors.white]) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle mediumTextStyle([Color? color = Colors.white]) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle smallTextStyle({Color? color = Colors.white70, bool italic = false}) {
  return TextStyle(
    fontStyle: (italic) ? FontStyle.italic : null,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle textfieldTextStyle() {
  return TextStyle(
    fontSize: 14,
    color: Colors.white.withOpacity(.68),
  );
}

TextStyle listTileTextStyle() {
  return TextStyle(
    fontSize: 16,
    color: Colors.white.withOpacity(0.87),
  );
}
