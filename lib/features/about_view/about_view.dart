import 'package:flutter/material.dart';
import 'package:vendors_app/components/appbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        label: 'About',
        leading: true,
      ),
      body: Container(),
    );
  }
}
