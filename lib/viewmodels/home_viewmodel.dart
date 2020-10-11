import 'package:magic_project/app/locator.dart';
import 'package:magic_project/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<dynamic> navigateTo(String routeName) {
    return _navigationService.navigateTo(routeName);
  }

}