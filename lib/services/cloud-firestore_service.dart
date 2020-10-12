import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:magic_project/models/shop_model.dart';
import 'package:magic_project/models/user_model.dart';

class CloudFirestoreService {
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');
  final CollectionReference _shopsCollectionReference = FirebaseFirestore.instance.collection('shops');

  final StreamController<List<ShopModel>> _shopsController = StreamController<List<ShopModel>>.broadcast();


  // ----- Users

  Future editUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toData()); 
    } catch (e) { return _exception(e); } 
  }

  Future getUser(String id) async {
    try {
      var userData = await _usersCollectionReference.doc(id).get();
      return UserModel.fromData(userData.data(), id);
    } catch (e) { return _exception(e); } 

  }

  // ----- Shops

  // Future addShop(ShopModel shop) async {
  //   try {
  //     await _shopsCollectionReference.add(shop.toData());
  //   } catch (e) { return _exception(e); } 
  // }

  Future getShops() async { 
    try {
        var shopSnapshot = await _shopsCollectionReference.get();
        if (shopSnapshot.docs.isNotEmpty) {
          return shopSnapshot.docs
            .map((snapshot) => ShopModel.fromData(snapshot.data(), snapshot.id))
            .toList();
        }
    } catch (e) { return _exception(e); } 
  }

  Stream listenShops() {
    _shopsCollectionReference.snapshots().listen((shopsSnapshot) {
      if (shopsSnapshot.docs.isNotEmpty) {
        var shops = shopsSnapshot.docs
            .map((snapshot) => ShopModel.fromData(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        _shopsController.add(shops);
      }
    });
    return _shopsController.stream;
  }

  // Future deleteShop(String id) async {
  //   try {
  //     await _shopsCollectionReference.doc(id).delete();
  //   } catch (e) { return _exception(e); } 
  // }

  // Future updateShop(ShopModel shop) async {
  //   try {
  //     await _shopsCollectionReference.doc(shop.id).update(shop.toData());
  //   } catch (e) { return _exception(e); } 
  // }

   // ----- Shared functions

  Future _exception(dynamic e) async {
    if (e is PlatformException) {
      return e.message;
    }
    return e.toString();
  }

}
