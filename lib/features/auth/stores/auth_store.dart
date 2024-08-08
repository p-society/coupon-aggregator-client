import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

final AuthStore authStore = AuthStore();

class AuthStore = Auth with _$AuthStore;

abstract class Auth with Store {
  @observable
  bool isLoading = false;

  @observable
  String? jwt;

  @action
  Future userLogin(String email, String password) async {
    isLoading = true;
    try {
      final dio = Dio();
      final url = '';
      final res = await dio.post(url);
      if (res.statusCode == 200) {
        print('success');
      } else {
        print("Error");
      }
    } catch (e) {
      throw (e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future userSignUp({required Map<String, dynamic> userData}) async {
    try {
      isLoading = true;
      await Future.delayed(const Duration(seconds: 4));
      /* final dio = Dio();
      final url = '';
      final res = await dio.post(url);
      if (res.statusCode == 200) {
        print('success');
      } else {
        print("Error");
       }*/
    } catch (e) {
      throw (e.toString());
    } finally {
      isLoading = false;
    }
  }
}
