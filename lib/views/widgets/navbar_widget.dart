import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: <Widget> [
          Expanded(child: Container()),
          GestureDetector(
            child: Text(
              "Nous contacter",
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey,
              ),
            ),
            onTap: () {

            }, 
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}