// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceController extends GetxController {
  //Notifications flag
  var notificationAllowed = true.obs;
  //theme mode String flag
  var themeMode = "Light".obs;

  //calling onit method
  @override
  void onInit() {
    initializeUserSettings();
    super.onInit();
  }

  //initialize User Settings(Preferences)
  initializeUserSettings() async {
    SharedPreferences _prefe = await SharedPreferences.getInstance();
    if (_prefe.get('themeMode') != null) {
      themeMode(_prefe.get('themeMode').toString());
    }
  }

  //set the current theme Mode and save to Shared preferences
  setTheme(String value) async {
    //save seleceted value
    themeMode(value);
    SharedPreferences _prefe = await SharedPreferences.getInstance();
    _prefe.setString('themeMode', value);
  }

//Save on shade preferences
  // saveSetting(String key, bool value) async{
  //   notificationAllowed(value);
  //     SharedPreferences _prefe = await SharedPreferences.getInstance();
  //   _prefe.setBool('notificationsAllowed', value);
  // }

  //Get the isDark value and return theme mode according to it
  ThemeMode get getThemeMode =>
      themeMode.value == "Dark" ? ThemeMode.dark : ThemeMode.light;
}
