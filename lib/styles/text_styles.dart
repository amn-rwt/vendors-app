import 'package:flutter/material.dart';

TextStyle largeHeadingTextStyle([Color? color = Colors.black87]) {
  return TextStyle(
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

TextStyle mediumHeadingTextStyle([Color? color = Colors.black87]) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle mediumTextStyle([Color? color = Colors.black54]) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle smallTextStyle({Color? color = Colors.black87, bool italic = false}) {
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
    color: Colors.black.withOpacity(.68),
  );
}

TextStyle listTileTextStyle() {
  return TextStyle(
    fontSize: 16,
    color: Colors.black.withOpacity(0.87),
  );
}
