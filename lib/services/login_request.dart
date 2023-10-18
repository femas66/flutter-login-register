import 'dart:convert';
import 'dart:io';

import 'package:auth_api/services/share_api.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginRequest extends ShareApi {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final box = GetStorage();

  Future<bool> login() async {
    final Uri uri = Uri.parse("${super.baseUrl}/login");
    http.Response response = await http
        .post(uri, body: {"email": email.text, "password": password.text});
    Map<String, dynamic> data = json.decode(response.body);
    if (data['meta']['code'] == 200) {
      box.write('token', data['data']['token']);
      print("Token : ${data['data']['token']}");
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    final Uri uri = Uri.parse("${super.baseUrl}/logout");
    http.Response response = await http.post(uri, headers: getToken());
  }
}
