// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_single_cascade_in_expression_statements

import 'package:app/Ecran/Pages/Home/IndexController.dart';
import 'package:app/Ecran/Pages/NouveauArticle/ListesArticleController.dart';
import 'package:app/Ecran/Pages/NouveauArticle/ListesNouveauArticle.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    EasyLoading.dismiss();
  }

  var index_control = Get.find<IndexController>();

  final art = Get.find<ListesArticleController>();

  Future<bool> appRetour() async {
    // prep.t.value = 0;
    // art.t.value = 0;
    bool AppExit = false;
    // if (prep.id_prep.value != 0) {
    //   prep.id_prep.value = 0;
    //   Get.appUpdate();
    //   top.t.value = 0;
    // } else {
    AwesomeDialog(
      context: context,
      btnCancelText: "Annuler",
      dialogType: DialogType.noHeader,
      headerAnimationLoop: false,
      btnOkColor: Color.fromARGB(255, 43, 47, 56),
      btnCancelColor: Colors.red,
      animType: AnimType.scale,
      padding: EdgeInsets.all(10),
      descTextStyle: TextStyle(fontSize: 15),
      desc: "Voulez-vous quitter l'application ?",
      btnCancelOnPress: () {
        AppExit = false;
      },
      btnOkOnPress: () {
        SystemNavigator.pop();
        AppExit = true;
      },
    )..show();

    return AppExit;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => appRetour(),
      child: Scaffold(
          body: ListesNouveauArticle(),
          bottomNavigationBar: Container(
            height: 20,
            color: Color.fromARGB(255, 43, 47, 56),
          )),
    );
  }
}
