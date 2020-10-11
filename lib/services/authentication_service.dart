import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/models/user_model.dart';
import 'package:magic_project/services/cloud-firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CloudFirestoreService _cloudFirestoreService = locator<CloudFirestoreService>();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future loginWithEmail({@required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({ @required String name, @required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _currentUser = UserModel(
        id: authResult.user.uid,
        name: name,
        password: password,
        email: email,
      );
      await _cloudFirestoreService.editUser(_currentUser);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _cloudFirestoreService.getUser(user.uid);
    }
  }
}