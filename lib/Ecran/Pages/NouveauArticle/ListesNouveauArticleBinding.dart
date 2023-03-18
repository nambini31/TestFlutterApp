// ignore_for_file: file_names

import 'package:app/Ecran/Pages/NouveauArticle/ListesArticleController.dart';
import 'package:get/get.dart';

class ListesNouveauArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListesArticleController());
  }
}
