import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/features/auth/enums/auth_enum.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_1.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_2.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';

class SwitchingAuthScreen extends StatelessWidget {
  const SwitchingAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final currentScreen = authStore.currentAuthScreen;
      switch (currentScreen) {
        case AuthScreens.loginScreen:
          return const LoginScreen();
        case AuthScreens.signUpScreen1:
          return const SignupScreenOne();
        case AuthScreens.signUpScreen2:
          return const SignupScreenTwo();
      }
    });
  }
}
