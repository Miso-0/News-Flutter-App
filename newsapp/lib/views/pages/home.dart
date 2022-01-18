// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:newsapp/controllers/functionality_controller.dart';
import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/controllers/widget_controller.dart';
import 'package:newsapp/views/tabs/news_tab.dart';
import 'package:newsapp/views/tabs/weather_tab.dart';
import 'package:newsapp/views/utils/reusable_constents.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scafoldkey = GlobalKey<ScaffoldState>();
  String title = "News";
  bool isAddLocatinVisible = false;

//drop down values for Theme mode selection
  static const dropDownItems = <String>["Light", "Dark", "System"];
  String valueSeleceted = "Light";

  final List<DropdownMenuItem<String>> _dropDownMenuItems = dropDownItems
      .map(
        (String value) => DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        ),
      )
      .toList();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          title = "News";
          isAddLocatinVisible = false;
        } else {
          title = "Weather";
          isAddLocatinVisible = true;
        }
      });
    });
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
    final _funController = Get.find<FunctionalityController>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        key: _scafoldkey,
        drawer: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: width * 0.6,
          height: height,
          color: Colors.blue,
          child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _scafoldkey.currentState!.openEndDrawer();
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: themeOf.iconTheme.color,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    getDivider(),
                    Row(
                      children: [
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          'Preferences',
                          style: themeOf.textTheme.headline1,
                        ),
                      ],
                    ),
                    getDivider(),
                    ListTile(
                      title: Text(
                        "Theme mode",
                        style: themeOf.textTheme.headline3,
                      ),
                      trailing: DropdownButton<String>(
                        value: valueSeleceted,
                        style: TextStyle(
                          color: _preferenceController.themeMode.value == "Dark"
                              ? Colors.grey.shade300
                              : Colors.grey.shade800,
                        ),
                        dropdownColor: themeOf.canvasColor,
                        onChanged: (String? value) {
                          _preferenceController.setTheme(value!);
                          setState(() {
                            valueSeleceted = value;
                          });
                        },
                        items: _dropDownMenuItems,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Notifications",
                        style: themeOf.textTheme.headline3,
                      ),
                      trailing: Obx(
                        () => Switch(
                          value:
                              _preferenceController.notificationAllowed.value,
                          onChanged: (value) {
                            _preferenceController.notificationAllowed(value);
                          },
                          activeColor: themeOf.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              //Top container with app
              margin: EdgeInsets.only(left: 10),
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: themeOf.textTheme.headline1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: isAddLocatinVisible,
                        child: IconButton(
                          onPressed: () {
                            // setState(() {
                            //   _scafoldkey.currentState!.openDrawer();
                            // });
                            _funController.loadWeather();
                          },
                          icon: Icon(
                            Icons.add_location,
                            size: 23,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _scafoldkey.currentState!.openDrawer();
                          });
                        },
                        icon: Icon(
                          MdiIcons.menu,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  new_tab(),
                  weather_tab(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: width,
          height: 60,
          color: Colors.transparent,
          child: TabBar(
            controller: _tabController,
            indicatorColor: themeOf.primaryColor,
            labelColor: themeOf.primaryColor,
            labelStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                iconMargin: EdgeInsets.all(0),
                icon: Icon(
                  MdiIcons.newspaper,
                ),
                text: 'News',
              ),
              Tab(
                iconMargin: EdgeInsets.all(0),
                icon: Icon(
                  MdiIcons.weatherLightningRainy,
                ),
                text: 'Weather',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
