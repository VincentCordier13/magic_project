import 'package:flutter/material.dart';
import 'package:universal_html/html.Dart' as html;

import 'package:magic_project/views/animations/translate-onhover_amination.dart';

extension HoverExtensions on Widget {
  static final appContainer = html.window.document.querySelectorAll('flt-glass-pane')[0];

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) {
        appContainer.style.cursor = 'pointer';
      },
      onExit: (event) {
        appContainer.style.cursor = 'default';
      },
    );
  }

  Widget moveUpOnHover(double tx, double ty) {
    return TranslateOnHover(
      child: this,
      tx: tx,
      ty: ty,
    );
  }
}