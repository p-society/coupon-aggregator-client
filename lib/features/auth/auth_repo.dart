import 'package:dio/dio.dart';

class AuthRepo {
  Future userLogin(String email, String password) async {
    try {
      final dio = Dio();
      final String url = '';
      final res =await dio.get(url);
      print(res.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
