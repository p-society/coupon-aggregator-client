import 'dart:convert';

import 'package:mess_mgmt/Global/models/user_model.dart';
import 'package:mess_mgmt/features/auth/repository/auth_repo.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

final AuthStore authStore = AuthStore();

class AuthStore = Auth with _$AuthStore;

abstract class Auth with Store {
  @observable
  bool isLoading = false;

  @observable
  String? jwt;

  @observable
  User? currentUser;

  @action
  Future userLogin(String email, String password) async {
    isLoading = true;
    try {} catch (e) {
      throw (e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future userSignUp({required Map<String, dynamic> userData}) async {
    isLoading = true;
    try {
      final res = await AuthRepository.userRegister(data: userData);
      if (res != null && res.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(res.body);
        final User user = User.fromJson(data);
        final sp = await SharedPreferences.getInstance();
        final userJson = jsonEncode(user.toJson());
        print(userJson);
        final bool isComplete = await sp.setString('user', userJson);
        if (isComplete) {
          currentUser = user;
        } else {
          currentUser = null;
        }
      } else if (res != null && res.statusCode == 409) {
        String error = jsonDecode(res.body)['message'];
        currentUser = null;
      }
    } catch (e) {
      throw (e.toString());
    } finally {
      isLoading = false;
    }
  }
}
