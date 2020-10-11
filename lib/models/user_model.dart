import 'package:flutter/material.dart';

class UserModel {
  String id;
  String name;
  String password;
  String email;

  UserModel({this.id, @required this.name, @required this.password, @required this.email});

  Map<String, dynamic> toJson() {}

  static UserModel fromData(Map<String, dynamic> Function() data) {}
}