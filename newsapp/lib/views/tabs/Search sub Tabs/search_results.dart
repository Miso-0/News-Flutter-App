// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/functionality_controller.dart';
import 'package:newsapp/views/utils/article_card.dart';

class search_results extends StatelessWidget {
  const search_results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _funController = Get.find<FunctionalityController>();
    return Container(
      margin: const EdgeInsets.all(5),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView.builder(
            itemCount: _funController.searchResults.length,
            itemBuilder: (context, index) {
              return article_card(article: _funController.searchResults[index]);
            }),
      ),
    );
  }
}
