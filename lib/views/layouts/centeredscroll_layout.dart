import 'package:flutter/material.dart';

class CenteredScrollLayout extends StatelessWidget {
  final List<Widget> children;
  final Widget appBar;
  const CenteredScrollLayout({Key key, this.children, this.appBar}) : super(key: key);

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
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            child: Column(
              children: children,
            )
          ),
        ),
      ),    
    );
  }
}