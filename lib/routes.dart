import 'package:auth_api/pages/dashboard.dart';
import 'package:auth_api/pages/my_login.dart';
import 'package:auth_api/pages/register.dart';
import 'package:auth_api/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => Dashboard(),
    '/login': (context) => MyLogin(),
    '/register': (context) => MyRegister(),
    '/splash': (context) => SplashScreen(),
  };
}
