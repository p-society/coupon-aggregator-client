import 'package:mess_mgmt/Global/models/user_model.dart';
import 'package:mess_mgmt/features/auth/error%20handling/auth_error.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_state_store.g.dart';

final AppState appState = AppState();

class AppState = _AppStateStore with _$AppState;

abstract class _AppStateStore with Store {
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
  
  @action
  Future initialization() async {
    await validateSession();
    if (!isExpire) {
      final sp = await SharedPreferences.getInstance();
      jwt = sp.getString('JWT');
      await dashboardStore.fetchAllMeals();
    } else {
      jwt = null;
      currentUser = null;
      isExpire = false;
    }
  }

  @action
  Future validateSession() async {
    final sp = await SharedPreferences.getInstance();
    final expireTime = sp.getInt('exp');
    if (expireTime != null) {
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      if (currentTime >= expireTime) {
        isExpire = true;
      }
    }
  }
}
