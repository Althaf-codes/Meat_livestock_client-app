import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicUserData {
  getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString("x-userName");
    return username.toString();
  }

  getPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    final phoneNumber = prefs.getString("x-phoneNumber");
    return phoneNumber.toString();
  }
}
