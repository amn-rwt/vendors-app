import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: ListTile(
          title: Text(label, style: mediumTextStyle()),
          trailing: (trailing)
              ? const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              : const SizedBox(),
          onTap: () => onTap!(),
        ),
      ),
    );
  }
}
