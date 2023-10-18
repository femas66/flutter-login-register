import 'dart:convert';

import 'package:auth_api/services/share_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterRequest extends ShareApi {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<int> register() async {
    Uri uri = Uri.parse("${super.baseUrl}/register");
    http.Response response = await http.post(uri, body: {
      "name": name.text,
      "email": email.text,
      "password": password.text
    });
    Map<String, dynamic> data = json.decode(response.body)['meta'];
    if (data['code'] == 200) {
      return 200;
    } else if (data['code'] == 422) {
      return 422;
    } else {
      return 500;
    }
  }
}
