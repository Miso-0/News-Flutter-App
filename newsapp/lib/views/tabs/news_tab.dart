// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/functionality_controller.dart';

import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/controllers/widget_controller.dart';

import 'package:newsapp/views/utils/reusable_constents.dart';
import 'package:newsapp/views/utils/reusable_widgets.dart';

class new_tab extends StatefulWidget {
  const new_tab({Key? key}) : super(key: key);

  @override
  _new_tabState createState() => _new_tabState();
}

class _new_tabState extends State<new_tab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var themeOf = Theme.of(context);
    final _funController = Get.find<FunctionalityController>();
    final _preferenceController = Get.find<PreferenceController>();
    final _widgetController = Get.find<WidgetController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          gap1(height),
          GestureDetector(
            onTap: () => Get.toNamed('/search'),
            child: Container(
              width: width * 0.95,
              height: 45,
              decoration: BoxDecoration(
                color: themeOf.canvasColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                    color: _preferenceController.themeMode == "Dark"
                        ? Colors.black
                        : Colors.grey.withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // _widgetController.isSearchViewVisible(true);
                      Get.toNamed('/search');
                    },
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          gap1(height),
          Expanded(
            child: Container(
              width: width,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 47,
                  title: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    labelStyle: themeOf.textTheme.headline2,
                    labelColor: _preferenceController.themeMode.value == "Dark"
                        ? Colors.white
                        : Colors.black,
                    isScrollable: true,
                    indicatorColor: themeOf.primaryColor,
                    tabs: [
                      Tab(
                        text: "Top headlines",
                      ),
                      Tab(
                        text: "Health",
                      ),
                      Tab(
                        text: "Business",
                      ),
                      Tab(
                        text: "Sport",
                      ),
                      Tab(
                        text: "Entertainment",
                      ),
                      Tab(
                        text: "Technology",
                      ),
                      Tab(
                        text: "Science",
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    getTab(context, _funController.topHeadlines),
                    getTab(context, _funController.healthHeadlines),
                    getTab(context, _funController.businessHeadlines),
                    getTab(context, _funController.sportHeadlines),
                    getTab(context, _funController.entertaintHeadlines),
                    getTab(context, _funController.techHeadlines),
                    getTab(context, _funController.scienceHeadlines),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
