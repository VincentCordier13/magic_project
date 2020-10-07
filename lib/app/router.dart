import 'package:flutter/material.dart';
import 'package:magic_project/views/home_view.dart';
import 'package:magic_project/views/mailer_view.dart';
import 'package:magic_project/views/shop_view.dart';

const String HomeRoute = "/home";
const String ShopsRoute = "/shops";
const String MailerRoute = "/mailer";

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings);
    case ShopsRoute:
      return _getPageRoute(ShopsView(), settings);
    case MailerRoute:
      return _getPageRoute(MailerView(), settings);
    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(
    child: child,
    routeName: settings.name,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName}) : super(
    settings: RouteSettings(name: routeName),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}