// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsapp/controllers/preference_controller.dart';

import 'package:newsapp/views/utils/reusable_constents.dart';

class weather_tab extends StatefulWidget {
  const weather_tab({Key? key}) : super(key: key);

  @override
  _weather_tabState createState() => _weather_tabState();
}

class _weather_tabState extends State<weather_tab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var themeOf = Theme.of(context);
    final _preferenceController = Get.find<PreferenceController>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              gap1(height),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mthatha',
                    style: TextStyle(
                      color: Color.fromRGBO(39, 139, 146, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  gap2(height),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: themeOf.cardColor,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                          color: _preferenceController.themeMode.value == "Dark"
                              ? Colors.black
                              : Colors.grey.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '18°',
                        style: TextStyle(
                          color: Color.fromRGBO(39, 139, 146, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                  gap2(height),
                  Text(
                    'Most clear',
                    style: TextStyle(
                      color: Color.fromRGBO(39, 139, 146, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                  ),
                  gap2(height),
                  Text(
                    'H:26°   L:16°',
                    style: TextStyle(
                      color: Color.fromRGBO(39, 139, 146, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              gap1(height),
              Container(
                width: width,
                height: height * 0.6,
                decoration: BoxDecoration(
                  color: themeOf.cardColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                      color: _preferenceController.themeMode.value == "Dark"
                          ? Colors.black
                          : Colors.grey.withOpacity(0.3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
