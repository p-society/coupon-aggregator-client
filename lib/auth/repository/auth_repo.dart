import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  static Future<String?> authenticate() async {
    try {
      String url = "http://20.81.43.214:3030/auth";
      Map<String, dynamic> data = {
        "strategy": "local",
        "email": "ERRT",
        "password": "ERRT@logerr.com"
      };
      Map<String, String> header = {
        "content-type": "application/json",
        // "Authorization" : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6ImFjY2VzcyJ9.eyJpYXQiOjE3MjI3OTI0ODMsImV4cCI6MTcyMjg3ODg4MywiYXVkIjoiaHR0cHM6Ly95b3VyZG9tYWluLmNvbSIsImlzcyI6ImZlYXRoZXJzIiwic3ViIjoiNjZhZmI5NWZkMmJjM2E4ZmUzNmI0NGFjIiwianRpIjoiMTcwYTI4NTYtODdjYy00ODAxLWEwNTYtMzZmOTZlMWI1ZjdhIn0.RfaEawpP2CEZBgarB0xrGhh2h_NhWz5fTfdFqAHfoP4"
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

  static userRegister(  {required Map<String, dynamic> data}) async {
    try {
      String url = "http://20.81.43.214:3030/users";
      var res = await http.post(Uri.parse(url), body: data);
      print(res);
    } catch (e) {
      print(e.toString());
    }
  }
}
