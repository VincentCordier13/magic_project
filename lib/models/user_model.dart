import 'package:flutter/material.dart';

class UserModel {
  String id;
  String name;
  String password;
  String email;

  UserModel({this.id, @required this.name, @required this.password, @required this.email});

  Map<String, dynamic> toData() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
    };
  }

  static UserModel fromData(Map<String, dynamic> data, String id) {
    if (data == null) return null;
    return UserModel(
      id: id,
      name: data['name'],
      password: data['password'],
      email: data['email']
    );
  }
}