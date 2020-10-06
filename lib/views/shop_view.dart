import 'package:flutter/material.dart';
import 'package:magic_project/views/layouts/centered_layout.dart';
import 'package:magic_project/views/widgets/navbar_widget.dart';
import 'package:magic_project/views/widgets/shop/map_widget.dart';
import 'package:magic_project/views/widgets/shop/shoplist_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ShopsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        desktop: _ShopViewDestop(),
        tablet: _ShopViewTablet(),
        mobile: _ShopViewMobile(),
      ),
    );
  }
}


class _ShopViewDestop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredLayout(
      child: Container(color: Colors.amber, height: 500, width: 500,),
      // child: Column(
      //   children: [
      //     NavBarWidget(),
      //     SizedBox(height: 20,),
      //     // ListView(
      //     //   children: [
      //     //     ShopListWidget(),
      //     //     MapWidget(),
      //     //   ]
      //     // ),
      //   ],
      // )
    );
  }
}

class _ShopViewTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class _ShopViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}