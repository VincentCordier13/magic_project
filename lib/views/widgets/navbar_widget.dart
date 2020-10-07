import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/app/router.dart';
import 'package:magic_project/services/navigation_service.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:magic_project/extensions/widget_extension.dart';

class NavBarWidget extends StatelessWidget {
  final bool isHomeView;
  const NavBarWidget({Key key, this.isHomeView = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screen) {
        return Container(
          margin: const EdgeInsets.all(10),
          height: 100,
          child: Row(
            children: [
              SizedBox(width: 50),
              isHomeView 
                ? Container() 
                : GestureDetector(
                  child: Image.asset("assets/magic-the-gathering.jpg",),
                  onTap: () {
                    locator<NavigationService>().navigateTo(HomeRoute);
                  }, 
                ), 
              Expanded(child: Container()),
              GestureDetector(
                child: Text(
                  "Nous contacter",
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w600, 
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  locator<NavigationService>().navigateTo(MailerRoute);
                }, 
              ).showCursorOnHover.moveUpOnHover(0, -10),
              SizedBox(width: 50),
            ],
          ),
        );
      }
    );
  }
}