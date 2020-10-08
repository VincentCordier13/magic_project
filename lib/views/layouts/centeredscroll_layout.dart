import 'package:flutter/material.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';

class CenteredScrollLayout extends StatelessWidget {
  final List<Widget> children;
  final Widget appBar;
  CenteredScrollLayout({Key key, this.children, this.appBar}): super(key: key);

  final ScrollController _scrollControler = ScrollController();

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
      body: Scrollbar(
        controller: _scrollControler,
        child: SingleChildScrollView(
            controller: _scrollControler,
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: children,
                )
              ),
            ),
          ),
        
      ),
    );
  }
}
