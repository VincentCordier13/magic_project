import 'package:magic_project/app/locator.dart';
import 'package:magic_project/models/shop_model.dart';
import 'package:magic_project/services/cloud-firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopsViewModel extends FutureViewModel<List<ShopModel>> {
  final _cloudFirestoreService = locator<CloudFirestoreService>();

  List<ShopModel> _shops = new List<ShopModel>();
  List<ShopModel> get shops => _shops;
  
  ShopModel _shopSelected;
  ShopModel get shopSelected => _shopSelected;


  @override
  Future<List<ShopModel>> futureToRun() async {
    await Future.delayed(Duration(seconds: 1));
    await _cloudFirestoreService.getShops().then((shopsInCloud) => _shops = shopsInCloud);

    _shops.forEach((shop) => print(shop.toString()));

    return shops;
  }

  void shopSelection(ShopModel shop) {
    _shopSelected = shop;
    notifyListeners();
  }

  void goWebsite(String url) async {
    print("url : " + url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } 

}