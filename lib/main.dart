import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Platform',
      home: Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10.0),
          color: Colors.blue[600],
          child: Text(
            "MagicPlatform",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          )
        ),
      )
    );
  }
}
