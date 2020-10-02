import 'package:flutter/material.dart';

class CenteredTemplate extends StatelessWidget {
  final Widget child;
  const CenteredTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(60),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),    
    );
  }
}