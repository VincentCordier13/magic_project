import 'package:magic_project/app/locator.dart';
import 'package:magic_project/models/shop.dart';
import 'package:magic_project/services/shops_service.dart';
import 'package:stacked/stacked.dart';

class ShopsViewModel extends BaseViewModel {
  final _shopsService = locator<ShopsService>();

  List<Shop> _shops;
  List<Shop> get shops => _shops;
  
  Shop _shopSelected;
  Shop get shopSelected => _shopSelected;


  ShopsViewModel() {
    _shops = _shopsService.getShops();
  }

  void shopSelection(Shop shop) {
    _shopSelected = shop;
    //notifyListeners();
  }

}