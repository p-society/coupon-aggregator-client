import 'package:flutter/material.dart';
import 'package:mess_mgmt/dashboard.dart';
import 'package:mess_mgmt/login.dart';
import 'package:mess_mgmt/signup.dart';
//import 'package:dio/dio.dart';

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
        '/dashboard': (context) => DashboardScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
