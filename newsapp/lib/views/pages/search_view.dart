// ignore_for_file: camel_case_types, prefer_const_constructors, unrelated_type_equality_checks, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/controllers/widget_controller.dart';
import 'package:newsapp/views/tabs/Search%20sub%20Tabs/recent_search_tab.dart';
import 'package:newsapp/views/tabs/Search%20sub%20Tabs/search_results.dart';
import 'package:newsapp/views/utils/reusable_constents.dart';

class search_view extends StatefulWidget {
  const search_view({Key? key}) : super(key: key);

  @override
  _search_viewState createState() => _search_viewState();
}

class _search_viewState extends State<search_view>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

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
    final _preferenceController = Get.find<PreferenceController>();
    final _widgetController = Get.find<WidgetController>();
    // FocusNode fn = FocusNode();
    // fn.requestFocus();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.79,
                      height: 37,
                      decoration: BoxDecoration(
                        color: themeOf.canvasColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 3),
                            color: _preferenceController.themeMode == "Dark"
                                ? Colors.black
                                : Colors.grey.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: themeOf.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              gap2(height),
              getDivider2(),
              Visibility(
                visible: true,
                child: Container(
                  width: width,
                  child: Center(
                    child: TabBar(
                      controller: _tabController,
                      labelStyle: themeOf.textTheme.headline2,
                      labelColor:
                          _preferenceController.themeMode.value == "Dark"
                              ? Colors.white
                              : Colors.black,
                      isScrollable: true,
                      indicatorColor: themeOf.primaryColor,
                      tabs: [
                        Tab(
                          text: "Recent Searches",
                        ),
                        Tab(
                          text: "Articles found",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    recent_searches_tab(),
                    search_results(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
