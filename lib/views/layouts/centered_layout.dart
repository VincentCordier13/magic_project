import 'package:flutter/material.dart';

class CenteredLayout extends StatelessWidget {
  final Widget child;
   final Widget appBar;
  const CenteredLayout({Key key, this.child, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: appBar,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),    
    );
  }
}