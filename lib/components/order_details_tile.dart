import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendors_app/styles/text_styles.dart';

class OrderDetailTile extends StatelessWidget {
  const OrderDetailTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text('Name'), Text('amt')],
          ),
          Row(
            children: [
              Icon(
                Icons.comment,
                color: Colors.black.withOpacity(.38),
                size: 16,
              ),
              Text('Comment', style: smallTextStyle())
            ],
          )
        ],
      ),
    );
  }
}
