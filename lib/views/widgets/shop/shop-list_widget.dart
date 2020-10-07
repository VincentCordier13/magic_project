import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/models/shop.dart';
import 'package:magic_project/viewmodels/shops_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:magic_project/extensions/widget_extension.dart';

class ShopListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShopsViewModel>.nonReactive(
      viewModelBuilder: () => locator<ShopsViewModel>(),
      builder: (context, viewmodel, child) {
        return Container(
          
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(30),
            itemCount: viewmodel.shops.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("coucou"),
                        SizedBox(width: 10),
                        Text("poto"),
                      ],
                    )
                  ),
                  Center(child: _ShopItem(shop: viewmodel.shops[index]).showCursorOnHover.moveUpOnHover(0, -30)),
                  
                ]
              );
            },
          ),
        );
      }
    );
  }
}

class _ShopItem extends StatelessWidget {
  final Shop shop;
  const _ShopItem({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.grey,
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(child: Image.asset(shop.photo)),
              Text(shop.name, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(shop.address, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
            ],
          ),
        ),
      ),
      onTap: () {
        print(shop.id);
      }
    );
  }
}