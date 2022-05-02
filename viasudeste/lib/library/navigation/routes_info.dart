import 'package:flutter/material.dart';
import 'package:viasudeste/src/screens/home_screen.dart';
import 'package:viasudeste/src/screens/login_screen.dart';
import 'package:viasudeste/src/screens/registrar_screen.dart';
import 'flows.dart';

class RoutesInfo {

  static dynamic getRoutes(dynamic settings) {
    switch (settings.name) {
      case Flows.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Flows.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case Flows.registrar:
        return MaterialPageRoute(
          builder: (context) => RegistrarScreen(),
          settings: settings,
        );
    }
  }
}