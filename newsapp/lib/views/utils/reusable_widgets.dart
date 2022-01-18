// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsapp/controllers/preference_controller.dart';

import 'package:newsapp/controllers/functionality_controller.dart';

import 'package:newsapp/views/utils/article_card.dart';

//work out the time the article was published
String countDays(DateTime date) {
  var now = DateTime.now();
  String finalvalue = "";
  var days = now.hour - date.hour;
  if (now.day - date.day != 0) {
    finalvalue = '${now.day - date.day}d ago';
  } else {
    if (now.hour - date.hour != 0) {
      finalvalue = '${now.hour - date.hour}h ago';
    } else {
      if (now.minute - date.minute != 0) {
        finalvalue = '${now.minute - date.minute}m ago';
      } else {
        finalvalue = 'Just now';
      }
    }
  }
  return finalvalue;
}

//re-usable card for each article
// Widget articleCard(BuildContext context, Article article) {

// }

Widget makeShimmer(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  var themeOf = Theme.of(context);
  final _preferenceController = Get.find<PreferenceController>();
  return Container(
    width: width,
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: themeOf.cardColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          blurRadius: 5,
          spreadRadius: 2,
          offset: const Offset(0, 5),
          color: _preferenceController.themeMode == "Dark"
              ? Colors.black
              : Colors.grey.withOpacity(0.3),
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        children: [
          FadeShimmer(
            width: width * 0.96,
            height: 50,
            fadeTheme: _preferenceController.themeMode.value == "Dark"
                ? FadeTheme.dark
                : FadeTheme.light,
            radius: 10,
          ),
          SizedBox(
            height: 10,
          ),
          FadeShimmer(
            width: width,
            height: 230,
            radius: 10,
            fadeTheme: _preferenceController.themeMode.value == "Dark"
                ? FadeTheme.dark
                : FadeTheme.light,
          ),
        ],
      ),
    ),
  );
}

ListView getLoading(BuildContext context) {
  return ListView(
    children: [
      SizedBox(
        height: 10,
      ),
      makeShimmer(context),
      makeShimmer(context),
    ],
  );
}

//resuable tabviewer with lists of each different news category
Widget getTab(BuildContext context, articles) {
  final _funController = Get.find<FunctionalityController>();
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  var themeOf = Theme.of(context);
  return Obx(
    () => articles.isEmpty
        ? getLoading(context)
        : Container(
            margin: const EdgeInsets.all(5),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return article_card(article: articles[index]);
                  }),
            ),
          ),
  );
}
