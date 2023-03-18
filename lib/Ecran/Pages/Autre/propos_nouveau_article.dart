// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:app/Ecran/Pages/NouveauArticle/ListesArticleController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class A_Propos_nouveau_article extends StatefulWidget {
  @override
  State<A_Propos_nouveau_article> createState() => _A_Propos_nouveau_articleState();
}

class _A_Propos_nouveau_articleState extends State<A_Propos_nouveau_article> {
  var article_control = Get.find<ListesArticleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 47, 56),
        title: Text("A propos"),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      child: Center(
                          child: Text(
                        article_control.article.value.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.network(
                      article_control.article.value.url,
                      width: MediaQuery.of(context).size.width / 1.50,
                    )
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
