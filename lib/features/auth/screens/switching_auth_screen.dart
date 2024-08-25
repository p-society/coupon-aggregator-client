import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/features/auth/enums/auth_enum.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_1.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_2.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

import '../../../Global/store/app_state_store.dart';
import '../../../Global/widgets/custom_error_messenger.dart';
import '../../../Global/widgets/custom_successfully_dialog.dart';

class SwitchingAuthScreen extends StatelessWidget {
  const SwitchingAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final currentScreen = authStore.currentAuthScreen;
      return ReactionBuilder(
        builder: (context) {
          return autorun((_) {
            final isLoading = authStore.isLoading;
            final authError = appState.authError;
            final isSuccessLoggedIn = authStore.isSuccessfullyLoggedin;
            final isSuccessSignedIn = authStore.isSuccessfullySignedUp;
            print("This is successsssss  :  $isSuccessSignedIn");
            if (!isLoading && authError != null) {
              showError(
                context,
                title: authError.errorString,
                description: authError.errorDescription,
              );
              appState.authError = null;
            }
            if (isSuccessLoggedIn) {
              showSuccessLogin(context);
            }
            if (isSuccessSignedIn) {
              showSuccessSignUp(context);
            }
          });
        },
        child: Builder(builder: (context) {
          switch (currentScreen) {
            case AuthScreens.loginScreen:
              return const LoginScreen();
            case AuthScreens.signUpScreen1:
              return const SignupScreenOne();
            case AuthScreens.signUpScreen2:
              return const SignupScreenTwo();
          }
        }),
      );
    });
  }
}
