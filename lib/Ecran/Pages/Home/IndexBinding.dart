// ignore_for_file: file_names

import 'package:app/Ecran/Pages/Home/IndexController.dart';
import 'package:get/get.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IndexController());
  }
}
