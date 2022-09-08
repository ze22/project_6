import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_guide/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class userPreferences{
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath: "assets/test.png",
    name: 'Grace Clare',
    occupation: 'Junior Mobile/Web Dev',
    cvpath: 'assets/cv.pg',
    region: 'Ashanti',
    address: 'k230/1',
    education: 'Bsc in Computer Science - KNUST march2016-novembver2020',
    sex: 'Female',


  );
  static Future init() async =>
  _preferences = await SharedPreferences.getInstance();


  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);

  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return  json == null ? myUser : User.fromJson(jsonDecode(json));
  }

}