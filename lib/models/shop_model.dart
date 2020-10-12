import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class ShopModel {
  String id;
  String name;
  String address;
  String website;
  String photo;
  GeoPoint location;
  int views;

  LatLng get latlng => LatLng(location.latitude, location.longitude);

  ShopModel({this.id, @required this.name, @required this.address,  @required this.website, @required this.photo, @required this.location, this.views});

  Map<String, dynamic> toData() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'website': website,
      'photo': photo,
      'location': location,
      'views': views,
    };
  }

  static ShopModel fromData(Map<String, dynamic> data, String id) {
    if (data == null) return null;
    return ShopModel(
      id: id,
      name: data['name'],
      address: data['address'],
      website: data['website'],
      photo: data['photo'],
      location: data['location'],
      views: data['views'],
    );
  }

  String toString() {
    return "{name: $name, address: $address, website: $website, photo: $photo, location: ${location.latitude}, ${location.longitude}, views: $views}";
  } 

}