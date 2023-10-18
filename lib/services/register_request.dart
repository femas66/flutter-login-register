import 'dart:convert';

import 'package:auth_api/services/share_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterRequest extends ShareApi {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> register() async {
    Uri uri = Uri.parse("${super.baseUrl}/register");
    http.Response response = await http.post(uri, body: {
      "name": name.text,
      "email": email.text,
      "password": password.text
    });
    Map<String, dynamic> data = json.decode(response.body)['data'];
    print(data);
  }
}
