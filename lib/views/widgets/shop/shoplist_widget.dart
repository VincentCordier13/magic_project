import 'package:flutter/material.dart';

class ShopListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        children: [
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
          _ShopItem(title: "Butin des trois Rois", text:"Sainte-Catherine", asset: "assets/butin-des-trois-rois.jpg",),
        ],
      )
    );
  }
}

class _ShopItem extends StatelessWidget {
  final String title;
  final String text;
  final String asset;
  const _ShopItem({Key key, this.title, this.text, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.grey,
        elevation: 3,
        child: Center(
          child: Column(
            children: [
              Expanded(child: Image.asset(asset)),
              Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
            ],
          ),
        ),
      ),
      onTap: () {

      }
    );
  }
}