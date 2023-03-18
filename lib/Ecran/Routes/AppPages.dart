// ignore_for_file: void_checks, file_names, unused_import

import 'package:app/Ecran/Pages/Autre/propos_nouveau_article.dart';
import 'package:app/Ecran/Pages/Home/IndexBinding.dart';
import 'package:app/Ecran/Pages/Home/index.dart';
import 'package:app/Ecran/Pages/NouveauArticle/ListesArticleController.dart';
import 'package:app/Ecran/Pages/NouveauArticle/ListesNouveauArticleBinding.dart';

import 'package:app/Ecran/Routes/AppRoutes.dart';

import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.listes_article, page: () => Index(), bindings: [IndexBinding(), ListesNouveauArticleBinding()]),

    // GetPage(
    //   name: AppRoutes.a_propos_top1000,
    //   page: () => A_propos(),
    // ),
    // GetPage(
    //   name: AppRoutes.a_propos_preparation,
    //   page: () => A_Propos_preparation(),
    // ),
    GetPage(
      name: AppRoutes.a_propos_nouveau_article,
      page: () => A_Propos_nouveau_article(),
    ),
    // GetPage(name: AppRoutes.releve, page: () => AjoutRelever(), bindings: [AjoutArticleNouveauBinding(), AjoutReleverBinding()])
  ];
}
