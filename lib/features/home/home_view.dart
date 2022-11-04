import 'package:flutter/material.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/text_styles.dart';
import 'package:vendors_app/components/components.dart';

class HomeView extends StatelessWidget {
  final String? uid;
  const HomeView({super.key, this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(label: 'Home', trailing: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            children: [
              const TodaysMenu(
                itemCount: 5,
                menuItems: [],
              ),
              const SizedBox(height: 10),
              Container(
                // height: 1000,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                // height: 1000,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Order',
                          textAlign: TextAlign.end,
                          style: largeHeadingTextStyle(),
                        ),
                        const Text(
                          '15',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 30,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.sort,
                          color: Colors.blue,
                          size: 16,
                        ),
                        Text(
                          'Sort',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    Flexible(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: 12,
                          separatorBuilder: (context, index) => const Divider(),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              const OrderDetailTile()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
