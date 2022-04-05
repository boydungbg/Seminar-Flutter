import 'package:flutter_boilerplate_project/ui/home/home.dart';
import 'package:flutter_boilerplate_project/ui/login/login.dart';
import 'package:flutter_boilerplate_project/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}



