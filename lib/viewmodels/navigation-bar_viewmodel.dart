import 'package:magic_project/app/locator.dart';
import 'package:magic_project/app/router.dart';
import 'package:magic_project/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class NavigationBarViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<dynamic> navigateToShopsView() {
    return _navigationService.navigateTo(ShopsRoute);
  }

  Future<dynamic> navigateToMailerView() {
    return _navigationService.navigateTo(MailerRoute);
  }
}