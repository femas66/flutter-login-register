import 'dart:convert';

import 'package:auth_api/models/user.dart';
import 'package:auth_api/services/share_api.dart';
import 'package:http/http.dart' as http;

class HttpRequest extends ShareApi {
  Future<UserModel> getUser() async {
    Uri uri = Uri.parse("${super.baseUrl}/user");

    http.Response response = await http.get(uri, headers: getToken());
    Map<String, dynamic> data = json.decode(response.body)['data'];
    return UserModel(id: data['id'], name: data['name'], email: data['email']);
  }
}
