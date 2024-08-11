import 'dart:convert';

import 'package:mess_mgmt/Global/models/user_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/features/auth/repository/auth_repo.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

final AuthStore authStore = AuthStore();

class AuthStore = Auth with _$AuthStore;

abstract class Auth with Store {
  @observable
  bool isLoading = false;

  @action
  Future userLogin(String email, String password) async {
    isLoading = true;
    try {
      final res = await AuthRepository.authenticate(
        email: email,
        password: password,
      );
      if (res != null && res.statusCode == 201) {
        final data = jsonDecode(res.body);
        final sp = await SharedPreferences.getInstance();
        final jwt = data['accessToken'];
        if (jwt != null) {
          sp.setString('JWT', jwt!);
          appState.jwt = jwt;
          final userJson = data['user'];
          appState.currentUser = User.fromJson(userJson);
          final expire = data['authentication']['payload']['exp'] as int;
          await sp.setInt('exp', expire);
          await dashboardStore.fetchAllMeals();
        }
      } else if (res != null && res.statusCode == 409) {
        String error = jsonDecode(res.body)['message'];
        appState.currentUser = null;
      }
    } catch (e) {
      print(e.toString());
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
        final bool isComplete = await sp.setString('user', userJson);
        if (isComplete) {
          appState.currentUser = user;
        } else {
          appState.currentUser = null;
        }
      } else if (res != null && res.statusCode == 409) {
        String error = jsonDecode(res.body)['message'];
        appState.currentUser = null;
      }
    } catch (e) {
      throw (e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future logout() async {
    final sp = await SharedPreferences.getInstance();
    final isRemoved = await sp.remove('JWT');
    if (isRemoved) {
      appState.currentUser = null;
      appState.jwt = null;
    }
  }
}
