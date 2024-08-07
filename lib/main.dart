import 'package:flutter/material.dart';
import 'package:mess_mgmt/features/dashboard/screens/dashboard.dart';
import 'package:mess_mgmt/features/auth/screens/login.dart';
import 'package:mess_mgmt/features/auth/screens/signup.dart';
//import 'package:dio/dio.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/dashboard': (context) =>const DashboardScreen(),
        '/signup': (context) => const SignupScreen(),
        '/login':(context)=>const LoginScreen(),
      },
    );
  }
}
