import 'package:get_it/get_it.dart';
import 'package:magic_project/services/cloud-firestore_service.dart';
import 'package:magic_project/services/mailer_service.dart';
import 'package:magic_project/services/navigation_service.dart';
import 'package:magic_project/services/shops_service.dart';
import 'package:magic_project/viewmodels/home_viewmodel.dart';
import 'package:magic_project/viewmodels/mailer_viewmodel.dart';
import 'package:magic_project/viewmodels/navigation-bar_viewmodel.dart';
import 'package:magic_project/viewmodels/shops_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ShopsService());
  locator.registerLazySingleton(() => MailerService());
  locator.registerLazySingleton(() => CloudFirestoreService());

  locator.registerLazySingleton(() => NavigationBarViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => ShopsViewModel());
  locator.registerLazySingleton(() => MailerViewModel());
}