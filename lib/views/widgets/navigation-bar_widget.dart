import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/app/router.dart';
import 'package:magic_project/services/navigation_service.dart';
import 'package:magic_project/viewmodels/navigation-bar_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:magic_project/extensions/widget_extension.dart';
import 'package:stacked/stacked.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavigationBarViewModel>.nonReactive(
      viewModelBuilder: () => locator<NavigationBarViewModel>(),
      builder: (context, viewmodel, child) => ResponsiveBuilder(
        builder: (context, screen) {
          return Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            child: Row(
              children: [
                GestureDetector(
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
      ),
    );
  }
}