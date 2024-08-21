import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_error_messenger.dart';
import 'package:mess_mgmt/Global/widgets/custom_successfully_dialog.dart';
import 'package:mess_mgmt/features/auth/screens/switching_auth_screen.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';
import 'package:mess_mgmt/features/dashboard/screens/dashboard_screen.dart';
import 'package:mobx/mobx.dart';

void main() async {
  // debugRepaintRainbowEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await appState.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutt',
      theme: AppTheme.lightTheme(),
      home: Observer(
        builder: (context) {
          final jwt = appState.jwt;
          if (jwt != null) {
            return const DashboardScreen();
          }
          return ReactionBuilder(
            builder: (context) {
              return autorun((_) {
                final isLoading = authStore.isLoading;
                final authError = appState.authError;
                final isSuccess = authStore.isSuccessfullyLoggedin;
                if (!isLoading && authError != null) {
                  showError(context, authError.errorDescription,
                      authError.errorString);
                  appState.authError = null;
                }
                if (isSuccess) {
                  showSuccessLogin(context);
                }
              });
            },
            child: const SwitchingAuthScreen(),
          );
        },
      ),
    );
  }
}
