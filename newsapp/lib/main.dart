// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newsapp/binders/bindings.dart';
import 'package:newsapp/controllers/preference_controller.dart';

import 'package:newsapp/views/pages/home.dart';
import 'package:newsapp/views/pages/search_view.dart';

import 'package:newsapp/views/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    final _themeMode = Get.put(PreferenceController());
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        initialBinding: Binder(),
        themeMode: _themeMode.themeMode.value == "System"
            ? ThemeMode.system
            : _themeMode.getThemeMode,
        darkTheme: newsDarkTheme,
        theme: newsLightTheme,
        getPages: [
          GetPage(
            name: '/home',
            page: () => Home(),
          ),
          GetPage(
            name: '/search',
            page: () => search_view(),
          ),
        ],
      );
    });
  }
}
