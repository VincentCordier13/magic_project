import 'package:flutter/material.dart';

class HomeActionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [                
          Image.asset('cards.png',
              height: 200,
          ),
          SizedBox(height: 10),
          Text(
            "Visiter le site",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey,
            )
          ),
        ],
      ),
      onTap: () {

      },
    );
  }
}