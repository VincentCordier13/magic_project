import 'package:flutter/material.dart';

class HomeSpeechWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "MAKE DEALS\nMAGIC AMAZING",
            style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 80, height: 0.9
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 21, height: 1.7, color: Colors.grey[800]),
              children: <TextSpan>[
                TextSpan(
                  text: "Notre mission est de vous aider à acquérir vos ", 
                ),
                TextSpan(
                  text: "Dream Magic Cards\n", 
                  style: TextStyle(fontStyle: FontStyle.italic)
                ),
                TextSpan(
                  text: "Vous pourrez enfin construire vos ", 
                ),
                TextSpan(
                  text: "Decks", 
                  style: TextStyle(fontStyle: FontStyle.italic)
                ),
                TextSpan(
                  text: " grâce à vos nouvelles cartes ! ", 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}