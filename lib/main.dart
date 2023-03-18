// ignore_for_file: prefer_const_constructors,, use_key_in_widget_constructors, depend_on_referenced_packages, non_constant_identifier_names

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:app/Ecran/Routes/AppPages.dart';
import 'package:app/Ecran/Routes/AppRoutes.dart';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  WidgetsBinding widgetbinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetbinding);
  runApp(Application());
  FlutterNativeSplash.remove();
}

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

enum PageTransitionType { fade, scale }

class _ApplicationState extends State<Application> {
  String val = "";

  String dateTime() {
    var date = DateTime.now();
    return DateFormat("dd/MM/yyyy HH:mm:ss").format(date);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 43, 47, 56),
    ));
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      home: AnimatedSplashScreen.withScreenRouteFunction(
        splash: "lib\\assets\\images\\logo-social.png",
        splashIconSize: 125,
        screenRouteFunction: () async => AppRoutes.listes_article,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      getPages: AppPages.pages,
    );
  }
}
