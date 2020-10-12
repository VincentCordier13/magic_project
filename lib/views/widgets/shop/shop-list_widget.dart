import 'package:flutter/material.dart';
import 'package:magic_project/models/shop_model.dart';
import 'package:magic_project/viewmodels/shops_viewmodel.dart';
import 'package:magic_project/extensions/widget_extension.dart';

class ShopListWidget extends StatelessWidget {
  final ShopsViewModel viewmodel;
  const ShopListWidget({Key key, this.viewmodel}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(30),
        itemCount: viewmodel.isBusy ? 4 : viewmodel.shops.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (context, index) {
          return viewmodel.isBusy 
          ? Container(color: Colors.blue,)
          : Center(
            child: GestureDetector(
              child: _ShopItem(
                shop: viewmodel.shops[index]
              ),
              onTap: () {  
                print("shop card " + viewmodel.shops[index].id.toString()); 
                viewmodel.shopSelection(viewmodel.shops[index]);
                viewmodel.goWebsite(viewmodel.shops[index].website);
              },
            ).showCursorOnHover
          );
        },
      ),
    );
  }
}

class _ShopItem extends StatelessWidget {
  final ShopModel shop;
  const _ShopItem({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}