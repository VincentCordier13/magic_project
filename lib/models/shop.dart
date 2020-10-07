import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class Shop {
  int id;
  LatLng latLng;
  String name;
  String address;
  String web;
  String photo;

  Shop({
    @required this.id, 
    @required this.latLng, 
    @required this.name, 
    @required this.address, 
    @required this.web, 
    @required this.photo
  });
}