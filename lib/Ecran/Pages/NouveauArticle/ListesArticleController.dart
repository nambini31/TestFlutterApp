// ignore_for_file: unused_local_variable, non_constant_identifier_names,, empty_catches, file_names, duplicate_ignore, avoid_print, deprecated_member_use, unnecessary_null_comparison, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:app/Ecran/modele/classe/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListesArticleController extends GetxController {
  TextEditingController searchControlleur = TextEditingController();

  TextEditingController nom = TextEditingController();
  TextEditingController nom1 = TextEditingController();
  RxList listesNouveau = <Article>[].obs;

  File? fichierImage;
  var news = "".obs;
  var news1 = "".obs;
  var t = 0.obs;
  var index = 0.obs;

  Rx<Article> article = Article().obs;

  var nbNouveau = 0.obs;
  var nbTransferer = 0.obs;

  void tapTopBar(int i) {
    index.value = i;
  }

  Future search(String txt) async {
    List produitlist = [];

    int a = 0;

    try {
      var response4 = http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos")).timeout(const Duration(seconds: 10)).then((valuecn) async {
        if (valuecn.statusCode == 200) {
          produitlist = json.decode(valuecn.body);
          listesNouveau.clear();
          for (var element in produitlist) {
            Article article = Article.ajt(
                int.parse(element["id"].toString()),
                int.parse(element["albumId"].toString()),
                (element["title"].toString() == null) ? "" : element["title"],
                (element["thumbnailUrl"].toString() == null) ? "" : element["thumbnailUrl"],
                (element["url"].toString() == null) ? "" : element["url"]);
            if (element["title"].toString().contains(txt)) {
              listesNouveau.add(article);
            }
          }
        } else {}
      }).onError((error, stackTrace) async {});
    } catch (e) {
      throw 1;
    }
  }

  SelectOneOne() async {
    List produitlist = [];
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.custom
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
    EasyLoading.show(status: 'En cours de chargement...');

    int a = 0;

    try {
      var response4 = http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos")).timeout(const Duration(seconds: 10)).then((valuecn) async {
        if (valuecn.statusCode == 200) {
          produitlist = json.decode(valuecn.body);
          for (var element in produitlist) {
            Article article = Article.ajt(
                int.parse(element["id"].toString()),
                int.parse(element["albumId"].toString()),
                (element["title"].toString() == null) ? "" : element["title"],
                (element["thumbnailUrl"].toString() == null) ? "" : element["thumbnailUrl"],
                (element["url"].toString() == null) ? "" : element["url"]);
            listesNouveau.add(article);
            a++;
          }
          if (a == produitlist.length) {
            EasyLoading.showSuccess("Succée");
          }
        } else {
          await EasyLoading.showError('404 not found', dismissOnTap: true, duration: Duration(seconds: 4));

          throw valuecn.statusCode;
        }
      }).onError((error, stackTrace) async {
        await EasyLoading.showError('Erreur de connexion', dismissOnTap: true, duration: Duration(seconds: 4));
      });
    } catch (e) {
      await EasyLoading.showError('Erreur de connexion', dismissOnTap: true, duration: Duration(seconds: 4));

      throw 1;
    }
  }
}
