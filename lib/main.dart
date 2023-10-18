import 'package:auth_api/pages/dashboard.dart';
import 'package:auth_api/pages/my_login.dart';
import 'package:auth_api/pages/register.dart';
import 'package:auth_api/pages/splash_screen.dart';
import 'package:auth_api/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/splash',
    routes: AppRoutes.routes,
  ));
}
