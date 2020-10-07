import 'package:get_it/get_it.dart';
import 'package:magic_project/services/navigation_service.dart';
import 'package:magic_project/services/shops_service.dart';
import 'package:magic_project/viewmodels/shops_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ShopsService());

  locator.registerLazySingleton(() => ShopsViewModel());
}