import 'package:flutter/material.dart';
import 'package:magic_project/views/layouts/centered-scroll_layout.dart';
import 'package:magic_project/views/widgets/navbar_widget.dart';
import 'package:magic_project/views/widgets/shop/shop-map_widget.dart';
import 'package:magic_project/views/widgets/shop/shop-list_widget.dart';
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
    return CenteredScrollLayout(
      appBar: NavBarWidget(),
      child: Column(
        children: [
          SizedBox(height: 30,),
          ShopListWidget(),
          SizedBox(height: 30,),
          ShopMapWidget(),
          SizedBox(height: 30,),
        ]
      )
    );
  }
}

class _ShopViewTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ShopViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
