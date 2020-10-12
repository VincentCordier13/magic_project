import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  bool _isInitialize;
  bool get isInitialize => _isInitialize;
  
  bool _hasError;
  bool get hasError => _hasError;

  FirebaseService.initialization() {
    print('Firebase initialization ...');
    Firebase.initializeApp().then((value) => value.name.toString()) //print('Firebase initialization ...'))
    .whenComplete(() => () {
      _isInitialize = true; 
      print('COMPLETED !');
    })
    .catchError(() => () {
      _hasError = true;
      print('ERROR !');
    }); 
  } 
  

}