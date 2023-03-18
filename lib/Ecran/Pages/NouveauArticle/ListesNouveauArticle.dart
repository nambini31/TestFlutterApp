// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison, file_names, constant_identifier_names, avoid_unnecessary_containers, avoid_print, avoid_returning_null_for_void, prefer_const_literals_to_create_immutables, unused_local_variable, unrelated_type_equality_checks, use_key_in_widget_constructors, avoid_single_cascade_in_expression_statements, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:app/Ecran/Pages/Autre/AucuneDonnes.dart';
import 'package:app/Ecran/Pages/NouveauArticle/ListesArticleController.dart';
import 'package:app/Ecran/Routes/AppRoutes.dart';
import 'package:app/Ecran/modele/classe/article.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Home/IndexController.dart';

enum Actions { Update, Delete }

class ListesNouveauArticle extends StatefulWidget {
  @override
  State<ListesNouveauArticle> createState() => _ListesNouveauArticleState();
}

class _ListesNouveauArticleState extends State<ListesNouveauArticle> {
  var index_control = Get.find<IndexController>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  var listes_nouv = Get.find<ListesArticleController>();
  final FocusNode setfocus = FocusNode();

  onSelectItem(value) {
    setfocus.requestFocus();
    listes_nouv.article.value.id = 0;
    if (value == 1) {
      listes_nouv.SelectOneOne();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Obx(
          () => AppBar(
            backgroundColor: Color.fromARGB(255, 4, 83, 143),
            leading: (listes_nouv.t.value == 0)
                ? IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      scaffoldkey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.person_pin,
                      size: 30,
                    ))
                : null,
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 10,
            toolbarTextStyle: TextStyle(backgroundColor: Colors.red),
            title: (listes_nouv.t.value == 1)
                ? TextFormField(
                    controller: listes_nouv.searchControlleur,
                    onChanged: (value) {
                      listes_nouv.search(value);
                    },
                    focusNode: setfocus,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15),
                        prefixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setfocus.requestFocus();
                              if (listes_nouv.t.value == 1) {
                                listes_nouv.t.value = 0;
                                if (listes_nouv.searchControlleur.text != "") {
                                  listes_nouv.searchControlleur.text = "";
                                  listes_nouv.search("");
                                }
                              }
                            },
                            icon: Icon(Icons.arrow_back)),
                        prefixIconColor: Colors.grey,
                        suffixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              if (listes_nouv.searchControlleur.text != "") {
                                listes_nouv.searchControlleur.text = "";
                                listes_nouv.search("");
                              }
                            },
                            icon: Icon(Icons.clear)),
                        hintText: "Rechercher",
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none),
                  )
                : Text("Liste des albums", style: TextStyle(fontSize: 16)),
            actions: (listes_nouv.t.value == 0)
                ? [
                    IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          setfocus.requestFocus();
                          listes_nouv.t.value = 1;
                          //prepa_control.search("");
                        },
                        icon: Icon(Icons.search)),
                    PopupMenuButton(
                      onSelected: onSelectItem,
                      icon: Icon(
                        Icons.more_vert_sharp,
                      ),
                      offset: Offset(0, AppBar().preferredSize.height),
                      itemBuilder: (context) {
                        return [
                          popuMenuItem("Charger l'album", Icons.downloading_outlined, 1),
                          // if (listes_nouv.nbEnregistrer.value > 0 && listes_nouv.index.value == 1)
                          //   popuMenuItem("Transferer Tout", Icons.send, 2),
                          if (listes_nouv.nbTransferer.value > 0 && listes_nouv.index.value == 2) popuMenuItem("Supprimer Tout", Icons.send, 3),
                        ];
                      },
                    )
                  ]
                : null,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Nouveau(),
      ),
    );
  }

  PopupMenuItem<int> popuMenuItem(String txt, IconData icons, int val) {
    return PopupMenuItem(
        value: val,
        child: Row(
          children: [
            Icon(
              icons,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(txt)
          ],
        ));
  }

  Widget Nouveau() {
    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      closeWhenTapped: true,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Obx(
          () => Center(
            child: (listes_nouv.listesNouveau.isEmpty)
                ? AucuneDonnes()
                : GestureDetector(
                    onTap: () {
                      setfocus.requestFocus();
                    },
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: listes_nouv.listesNouveau.length,
                        itemBuilder: (context, index) {
                          Article article = listes_nouv.listesNouveau[index];
                          return Container(
                            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                            child: Slidable(
                                closeOnScroll: true,
                                child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 43, 47, 56),
                                          offset: Offset(0, 0), //(x,y)
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        listes_nouv.article.value = article;

                                        alerteDescription();
                                      },
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextConcurArticle(article.title),
                                        ],
                                      ),
                                      //subtitle: TextConcurArticle("Cin         : ${article.cin}"),
                                      leading: Icon(
                                        Icons.album,
                                        size: 40,
                                        color: Color.fromARGB(255, 43, 47, 56),
                                      ),
                                    ))),
                          );
                        }),
                  ),
          ),
        ),
      ),
    );
  }

  Text TextConcurArticle(String libelle) {
    return Text(
      libelle,
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }

  showImage(String img) {
    return Image.memory(
      base64Decode(img),
      fit: BoxFit.cover,
    );
  }

  Future alerteDescription() async {
    Get.toNamed(AppRoutes.a_propos_nouveau_article);
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
