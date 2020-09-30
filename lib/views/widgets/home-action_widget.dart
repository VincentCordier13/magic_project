import 'package:flutter/material.dart';
import 'package:magic_project/views/widgets/action_widget.dart';

class HomeActionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActionWidget("Entrer sur le site"),
          SizedBox(height: 50),
          ActionWidget("Entrer sur le site"),
        ]
      ),
    );
  }
}