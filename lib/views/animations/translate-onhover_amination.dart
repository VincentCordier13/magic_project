import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget child;
  final double tx;
  final double ty;
  TranslateOnHover({Key key, this.child, this.tx, this.ty}) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {

    final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
    final hoverTransform = Matrix4.identity()..translate(widget.tx, widget.ty, 0);

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}