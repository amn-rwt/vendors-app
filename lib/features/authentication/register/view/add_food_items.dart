import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendors_app/components/appbar.dart';

class AddFoodItemsView extends StatelessWidget {
  const AddFoodItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(label: 'Add Items'),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.black,
                  ),
                  Text('here')
                ],
              )),
    );
  }
}
