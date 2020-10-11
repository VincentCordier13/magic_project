import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/app/router.dart';
import 'package:magic_project/services/navigation_service.dart';
import 'package:magic_project/extensions/widget_extension.dart';
import 'package:magic_project/viewmodels/home_viewmodel.dart';
import 'package:stacked/stacked.dart';


class HomeEntryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      builder: (context, viewmodel, child) {
        return GestureDetector(
          child: Center(
            child: Stack(
              children: [                
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/cards.png',
                      height: 200,
                  ),
                ),
                Container(
                  height: 220,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Text(
                        "Visiter le site",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,  
                          color: Colors.grey,
                        )
                      ),
                    ]
                  ),
                ).showCursorOnHover
                .moveUpOnHover(0, -10)
              ],
            ),
          ),
          onTap: () {
            viewmodel.navigateTo(ShopsRoute);
          },
        );
      }
    );
  }
}