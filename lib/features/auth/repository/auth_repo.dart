import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_endpoints.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_helper.dart';

class AuthRepository {
  static Future<http.Response?> authenticate({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "strategy": "local",
      "email": email,
      "password": password,
    };
    final Uri uri =
        ApiHelper.getUri(urlEndpoint: ApiEndpoints.authenticateUserApiEndpoint);
    Map<String, String> header = ApiHelper.getApiHeader(jwt: null);
    var res = await http
        .post(uri, body: jsonEncode(data), headers: header)
        .timeout(const Duration(seconds: 7));
    return res;
  }

  static Future<http.Response?> userRegister({
    required Map<String, dynamic> data,
  }) async {
    try {
      final uri = ApiHelper.getUri(urlEndpoint: ApiEndpoints.createUserApiEndpoint);
      var res = await http.post(uri, body: data);
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }
}
