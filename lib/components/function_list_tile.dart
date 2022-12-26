import 'package:flutter/material.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/text_styles.dart';

class CustomListTile extends StatelessWidget {
  final String label;
  final Function? onTap;
  final bool trailing;

  const CustomListTile(
      {super.key, required this.label, this.onTap, this.trailing = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: containerBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: ListTile(
          title: Text(label, style: mediumTextStyle(Colors.white60)),
          trailing: (trailing)
              ? const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white30,
                  size: 16,
                )
              : const SizedBox(),
          onTap: () => onTap!(),
        ),
      ),
    );
  }
}
