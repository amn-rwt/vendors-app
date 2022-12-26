import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/home/home_controller.dart';
import 'package:vendors_app/styles/text_styles.dart';
import 'package:vendors_app/components/components.dart';

class HomeView extends StatelessWidget {
  final String? uid;
  const HomeView({super.key, this.uid});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(context: context));
    return Scaffold(
      appBar: const CustomAppbar(label: 'Home', trailing: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                StreamBuilder(
                    stream: controller.todaysMenuStream,
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? const CupertinoActivityIndicator()
                          : TodaysMenu(
                              snapshot: snapshot,
                            );
                    }),
                const SizedBox(height: 10),
                Container(
                  // height: 1000,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: containerBackgroundColor,
                  ),
                  // height: 1000,
                  child: StreamBuilder(
                    stream: controller.orders,
                    builder: (context, snapshot) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Total Orders',
                                textAlign: TextAlign.end,
                                style: largeHeadingTextStyle(),
                              ),
                              Text(
                                (snapshot.data == null)
                                    ? '0'
                                    : snapshot.data!.docs!.length.toString(),
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 5),
                          (snapshot.data == null ||
                                  snapshot.data!.docs!.length == 0)
                              ? Column(
                                  children: [
                                    Image.asset(
                                        'lib/assets/no_order_recieved.png'),
                                    const SizedBox(height: 8),
                                    Text(
                                      'No orders recived yet.',
                                      style: smallTextStyle(italic: true),
                                    ),
                                  ],
                                )
                              : Row(
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
                              itemCount: snapshot.data == null
                                  ? 0
                                  : snapshot.data.docs.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CupertinoActivityIndicator();
                                } else if (snapshot.hasError) {
                                  return const Text('Something went wrong');
                                } else if (snapshot.hasData) {
                                  if (snapshot.data != null) {
                                    const OrderDetailTile();
                                  } else {
                                    const Text('No orders recived yet.');
                                  }
                                }
                                return const Text('Something went wrong');
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
