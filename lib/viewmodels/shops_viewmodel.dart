import 'package:magic_project/app/locator.dart';
import 'package:magic_project/models/shop_model.dart';
import 'package:magic_project/services/cloud-firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopsViewModel extends BaseViewModel {
  final _cloudFirestoreService = locator<CloudFirestoreService>();

  List<ShopModel> _shops;
  List<ShopModel> get shops => _shops;
  
  ShopModel _shopSelected;
  ShopModel get shopSelected => _shopSelected;


  ShopsViewModel() {
    // _shops = _cloudFirestoreService.getShops();
  }

  void shopSelection(ShopModel shop) {
    _shopSelected = shop;
    //notifyListeners();
  }

  void goWebsite(ShopModel shop) async {
    var url = shop.website;
    print("url : " + url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  

}