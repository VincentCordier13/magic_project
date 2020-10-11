import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_project/models/shop_model.dart';
import 'package:magic_project/models/user_model.dart';

class CloudFirestoreService {
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');
  final CollectionReference _shopsCollectionReference = FirebaseFirestore.instance.collection('shops');

  final StreamController<List<ShopModel>> _shopsController = StreamController<List<ShopModel>>.broadcast();


  // ----- Users

  Future editUser(UserModel user) async {
    _handleException(onTry: () async {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    });
  }

  Future getUser(String uid) async {
    _handleException(onTry: () async {
      var userData = await _usersCollectionReference.doc(uid).get();
      return UserModel.fromData(userData.data);
    });

  }

  // ----- Shops

  Future addShop(ShopModel shop) async {
    _handleException(onTry: () async {
      await _shopsCollectionReference.add(shop.toMap());
    });
  }

  Future getShopsOnceOff() async {
    _handleException(onTry: () async {
      var shopSnapshot = await _shopsCollectionReference.get();
      if (shopSnapshot.docs.isNotEmpty) {
        return shopSnapshot.docs
            .map((snapshot) => ShopModel.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
    });
  }

  Stream listenToShopsRealTime() {
    _shopsCollectionReference.snapshots().listen((shopsSnapshot) {
      if (shopsSnapshot.docs.isNotEmpty) {
        var posts = shopsSnapshot.docs
            .map((snapshot) => ShopModel.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        _shopsController.add(posts);
      }
    });

    return _shopsController.stream;
  }

  Future deleteShop(String id) async {
    _handleException(onTry: () async {
      await _shopsCollectionReference.doc(id).delete();
    });
  }

  Future updateShop(ShopModel shop) async {
    _handleException(onTry: () async {
      await _shopsCollectionReference.doc(shop.id).update(shop.toMap());
    });
  }


  // ----- Shared functions

  Future _handleException({@required Function onTry}) async {
    try {
      return await onTry();
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

}
