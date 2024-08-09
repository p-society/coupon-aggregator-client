import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_1.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_2.dart';
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
        '/signup_screen_1': (context) => const SignupScreenOne(),
        '/signup_screen_2':(context)=>const SignupScreenTwo(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
