import 'package:flutter/material.dart';

class InformationBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: <Widget> [
          SizedBox(width: 20),
          GestureDetector(
            child: Text(
              "Informations",
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey,
              ),
            ),
            onTap: () {

            }, 
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}