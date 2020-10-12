import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/viewmodels/shops_viewmodel.dart';
import 'package:magic_project/views/layouts/centered-scroll_layout.dart';
import 'package:magic_project/views/widgets/navigation-bar_widget.dart';
import 'package:magic_project/views/widgets/shop/shop-map_widget.dart';
import 'package:magic_project/views/widgets/shop/shop-list_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class ShopsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<ShopsViewModel>.reactive(
        viewModelBuilder: () => locator<ShopsViewModel>(),
        builder: (context, viewmodel, child) => ScreenTypeLayout(
          desktop: _ShopViewDestop(viewmodel: viewmodel),
          tablet: _ShopViewTablet(),
          mobile: _ShopViewMobile(),
        )
      )
    );
  }
}

class _ShopViewDestop extends StatelessWidget {
  final ShopsViewModel viewmodel;
  const _ShopViewDestop({Key key, this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredScrollLayout(
      appBar: NavigationBarWidget(),
      child: Column(
        children: [
          SizedBox(height: 30,),
          ShopListWidget(viewmodel: viewmodel),
          SizedBox(height: 30,),
          ShopMapWidget(viewmodel: viewmodel),
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
