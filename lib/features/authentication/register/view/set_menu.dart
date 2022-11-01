import 'package:flutter/material.dart';
import 'package:vendors_app/components/appbar.dart';
import 'package:vendors_app/components/large_button.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/styles/text_styles.dart';

Day today = Day(items: ['One', 'Two', 'Three', 'Four'], day: 'Today');
List<Map<String, dynamic>> items = List.generate(4, (index) => today.toMap());

class Day {
  final List<String> items;
  final String day;
  Day({required this.items, required this.day});

  Map<String, dynamic> toMap() {
    return {
      'items': items,
      'day': day,
    };
  }
}

class ExpansionPanelExample extends StatefulWidget {
  const ExpansionPanelExample({super.key});

  @override
  State<ExpansionPanelExample> createState() => _ExpansionPanelExampleState();
}

class _ExpansionPanelExampleState extends State<ExpansionPanelExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(label: 'Set', leading: true),
      backgroundColor: scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: ExpansionTile(
                            maintainState: true,
                            title: Text(today.day, style: mediumTextStyle()),
                            initiallyExpanded: (index == 0) ? true : false,
                            children: [
                              GridView.builder(
                                itemCount: today.items.length + 1,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  // crossAxisSpacing: 4,
                                ),
                                itemBuilder: (context, index) =>
                                    (index == today.items.length)
                                        ? Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                color: primaryColor,
                                                child: const Icon(Icons.add,
                                                    color: Colors.white),
                                              ),
                                              (today.items.isEmpty)
                                                  ? Text(
                                                      'Add items',
                                                      style: smallTextStyle(
                                                          Colors.blue),
                                                    )
                                                  : Text(
                                                      'Add more',
                                                      style: smallTextStyle(
                                                          Colors.blue),
                                                    ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Tooltip(
                                                showDuration: const Duration(
                                                    milliseconds: 400),
                                                waitDuration: const Duration(
                                                    milliseconds: 100),
                                                message: today.items[index],
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                today.items[index],
                                                style: smallTextStyle(),
                                              ),
                                            ],
                                          ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: 6, // * No of expansion tiles
                    ),
                    const SizedBox(height: 20),
                    LargeButton(label: 'Next', onPressed: () {})
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
