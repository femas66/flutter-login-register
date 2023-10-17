import 'package:auth_api/pages/dashboard.dart';
import 'package:auth_api/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/': (context) => Dashboard(),
      '/login': (context) => LoginPage(),
    },
  ));
}
