import 'package:flutter/material.dart';

class AwareListItemWidget extends StatefulWidget {
  final Function itemCreated;
  final Widget child;
  const AwareListItemWidget({Key key, this.itemCreated, this.child}) : super(key: key);

  @override
  _AwareListItemWidgetState createState() => _AwareListItemWidgetState();
}

class _AwareListItemWidgetState extends State<AwareListItemWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.itemCreated != null) {
      widget.itemCreated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}