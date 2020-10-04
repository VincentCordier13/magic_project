import 'package:flutter/material.dart';

class FirstNavWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [                
          Image.asset('assets/cards.png',
              height: 200,
          ),
          SizedBox(height: 10,),
          Text(
            "Visiter le site",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,  
              color: Colors.grey,
            )
          ),
        ],
      ),
      onTap: () {

      },
    );
  }
}