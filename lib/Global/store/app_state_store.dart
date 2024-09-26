import 'dart:convert';

import 'package:mess_mgmt/Global/Helper/Storage/storage_helper.dart';
import 'package:mess_mgmt/Global/models/user_model.dart';
import 'package:mess_mgmt/features/auth/error%20handling/auth_error.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';
import 'package:mobx/mobx.dart';

part 'app_state_store.g.dart';

final AppState appState = AppState();

class AppState = AppStateStore with _$AppState;

abstract class AppStateStore with Store {
  @observable
  String? jwt;

  @observable
  bool isLoading = false;

  @observable
  bool isExpire = false;

  @observable
  User? currentUser;

  @observable
  AuthError? authError;

  @observable
  bool canDialogPop = false;

  @action
  Future initialization() async {
    await validateSession();
    final storage = StorageHelper.instance.storage;
    if (!isExpire) {
      jwt = await storage.read(key: 'JWT');
      final json = await storage.read(key: 'userJsonString');

      if (json != null) {
        currentUser = User.fromJson(jsonDecode(json));
      } else {
        jwt = null;
        currentUser = null;
      }
      await dashboardStore.fetchAllMeals();
    } else {
      jwt = null;
      currentUser = null;
      isExpire = false;
    }
  }

  @action
  Future validateSession() async {
    final storage = StorageHelper.instance.storage;
    final expireTime = await storage.read(key: 'exp');
    if (expireTime != null) {
      final exp = int.tryParse(expireTime);
      if (exp != null) {
        final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        if (currentTime >= exp) {
          isExpire = true;
        }
      }
    }else{
      isExpire = true;
    }
  }
}
