import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static Future<http.Response?> authenticate({
    required String email,
    required String password,
  }) async {
    try {
      String url = dotenv.env['Authenticate_Url'] as String;
      Map<String, dynamic> data = {
        "strategy": "local",
        "email": email,
        "password": password,
      };
      Map<String, String> header = {
        "content-type": "application/json",
      };
      var res = await http.post(Uri.parse(url),
          body: jsonEncode(data), headers: header);
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<http.Response?> userRegister({
    required Map<String, dynamic> data,
  }) async {
    try {
      String url = dotenv.env['User_Register_Url'] as String;
      var res = await http.post(Uri.parse(url), body: data);
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }
}
