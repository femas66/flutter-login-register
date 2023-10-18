import 'package:get_storage/get_storage.dart';

class ShareApi {
  final String baseUrl = "https://api.femasproject.cloud/api";

  Map<String, String>? getToken() {
    final box = GetStorage();
    String? token = box.read('token');
    if (token != null) {
      return {"Authorization": "Bearer " + token, "Accept": "application/json",};
    } else {
      return null;
    }
  }
}
