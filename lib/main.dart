import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/screens/signup.dart';
import 'package:mess_mgmt/features/dashboard/screens/dashboard.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme(),
      home: const LoginScreen(),
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
