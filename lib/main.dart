import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/app/router.dart';
// import 'package:magic_project/services/firebase_service.dart';
import 'package:magic_project/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //FirebaseService.initialization();
    return MaterialApp(
      title: 'MDMA',
      builder: (context, child) => Container(child: child,),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}
