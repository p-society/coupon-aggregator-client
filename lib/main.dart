import 'package:flutter/material.dart';
import 'package:mess_mgmt/auth/screens/loginScreen.dart';
import 'package:mess_mgmt/auth/screens/nextLoginScreen.dart';
import 'package:mess_mgmt/auth/screens/otpVerificationScreen.dart';
import 'package:mess_mgmt/dashboard.dart';
import 'package:mess_mgmt/auth/screens/signupScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/signup': (context) => const SignupScreen(),
        '/loginScreen': (context) => const LoginScreen(),
        '/next': (context) => const NextLoginScreen(),
        '/otpVerificationScreen': (context) => const Otpverificationscreen(),
      },
    );
  }
}
