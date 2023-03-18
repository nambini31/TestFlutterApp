// ignore_for_file: non_constant_identifier_names, file_names, empty_catches, unused_local_variable, unnecessary_overrides

import 'package:get/get.dart';

class IndexController extends GetxController {
  var tabIndex = 0.obs;

  var prenom = "".obs;
  var lieu = "".obs;
  var email = "".obs;
  var matr = "".obs;
  var idmi = 0.obs;

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();

    // selectInfo();
  }
}
