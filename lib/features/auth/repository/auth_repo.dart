import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static Future<String?> authenticate() async {
    try {
      String url = dotenv.env['Authenticate_Url'] as String;
      Map<String, dynamic> data = {
        "strategy": "local",
        "email": "ERRT",
        "password": "ERRT@logerr.com"
      };
      Map<String, String> header = {
        "content-type": "application/json",
      };
      var res = await http.post(Uri.parse(url),
          body: jsonEncode(data), headers: header);

      final dta = jsonDecode(res.body);
      return dta['accessToken'];
    } catch (e) {
      print(e.toString());
    }
    return null;
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
