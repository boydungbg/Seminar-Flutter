import 'package:flutter_boilerplate_project/ui/demo/demo_inherited.dart';
import 'package:flutter_boilerplate_project/ui/demo/demo_navigator.dart';
import 'package:flutter_boilerplate_project/ui/demo/demo_provider.dart';
import 'package:flutter_boilerplate_project/ui/demo/life_widget.dart';
import 'package:flutter_boilerplate_project/ui/demo/snackbar_error.dart';
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
  static const String demoLifeWidget = '/demoLifeWidget';
  static const String demoContext = '/demoContext';
  static const String demoNavigator = '/demoNavigator';
  static const String demoProvider = '/demoProvider';
  static const String demoInherited = '/demoInherited';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    demoLifeWidget: (BuildContext context) => DemoLifeWidget(),
    demoContext: (BuildContext context) => DemoContext(),
    demoNavigator: (BuildContext context) => DemoNavigator(),
    demoProvider: (BuildContext context) => DemoProvider(),
    demoInherited: (BuildContext context) => InheritedWidgetExample(),
  };
}
