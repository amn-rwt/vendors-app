import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendors_app/components/components.dart';

class PaymentAndBillsView extends StatelessWidget {
  const PaymentAndBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(leading: true, label: 'Payment and Bills'),
      body: Container(),
    );
  }
}
