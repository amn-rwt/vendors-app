import 'package:flutter/material.dart';

class SetItemsExpansionPanel extends StatelessWidget {
  const SetItemsExpansionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      // expansionCallback: (panelIndex, isExpanded) => ,
      animationDuration: const Duration(milliseconds: 200),
      children: [
        // ExpansionPanel(
        //   headerBuilder: (context, isExpanded) => Text('Monday'),
        //   body: body,
        // )
      ],
    );
  }
}
