import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendors_app/components/appbar.dart';

class BillsAndPaymentView extends StatelessWidget {
  const BillsAndPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        label: 'Bills and Payment',
        leading: true,
      ),
      body: Container(),
    );
  }
}
