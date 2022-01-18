// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/logic/article_model.dart';

import 'package:newsapp/views/utils/reusable_constents.dart';
import 'package:newsapp/views/utils/reusable_widgets.dart';

class article_card extends StatefulWidget {
  final Article article;
  const article_card({Key? key, required this.article}) : super(key: key);

  @override
  _article_cardState createState() => _article_cardState();
}

class _article_cardState extends State<article_card> {
  @override
  Widget build(BuildContext context) {
    var article = widget.article;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var themeOf = Theme.of(context);
    final _preferenceController = Get.find<PreferenceController>();

    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('taped');
        }
      },
      child: Container(
        width: width,
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 1),
        decoration: BoxDecoration(
          color: themeOf.cardColor,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 5),
              color: _preferenceController.themeMode.value == "Dark"
                  ? Colors.black
                  : Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        child: Column(children: [
          Visibility(
            visible: article.urlToImage == null ? false : true,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
                width: width,
                child: Image(
                  image: NetworkImage(article.urlToImage.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          gap1(height),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Visibility(
                  visible: article.title == null ? false : true,
                  child: Text(
                    article.title.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                gap1(
                  height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.timelapse,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Visibility(
                          visible: article.publishedAt == null ? false : true,
                          child: Text(
                            countDays(article.publishedAt!),
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              article.setLiked();
                            });
                          },
                          icon: article.liked
                              ? const Icon(Icons.favorite)
                              : const Icon(
                                  Icons.favorite_border,
                                ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share_sharp,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
