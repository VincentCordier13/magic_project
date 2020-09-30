import 'package:flutter/material.dart';
import 'package:magic_project/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Project',
      home: HomeView(),
    );
  }
}
