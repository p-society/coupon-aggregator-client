import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/field_validation_function.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_pwd_tile.dart';
import 'package:mess_mgmt/Global/widgets/custom_text_field.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/Global/widgets/scaffold_messenger.dart';
import 'package:mess_mgmt/features/Networking/widgets/wobbleAppbar.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_1.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();

  void login() async {
    print('sakfhakhfashf');
    if (!isValidate(_emailController.text)) {
      showMessage(message: "Enter Valid Email", context: context);
      return;
    }
    showValidateDialog(context, Builder(builder: (context) => Container()));
    await Future.delayed(const Duration(seconds: 2));
    Map<String, dynamic> data = {
      "strategy": "local",
      "email": _emailController.text.trim(),
      "password": _pwdController.text.trim(),
    };
    
    print(data);
    authStore.userLogin(
        _emailController.text.trim(), _pwdController.text.trim());
        
    showValidateDialog(context, Builder(builder: (context) => Container()));
    await Future.delayed(const Duration(seconds: 2));
  }

  void signupNow() {
    navigateAndPopToNextScreen(
        nextScreen: const SignupScreenOne(), context: context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  void showValidateDialog(BuildContext context, Builder builder) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          
          return Dialog(
            
            backgroundColor: Colors.transparent, // Make background transparent
          child: BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Apply blur effect
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    Colors.white.withOpacity(0.2), // Slightly opaque background
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white
                      .withOpacity(0.3), // White border with slight opacity
                  width: 1.5,
                ),
                
              ),
              child: const Text("Successfully logged in"),
          )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WobbleAppBar(
        title: "Welcome back",
        color: Colors.white,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppTheme.linearGradient(),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // Make the content scrollable
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: LottieBuilder.asset(
                      'assets/lottie/signup_anim2.json',
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Enter email-id',
                    controller: _emailController,
                    type: TextInputType.emailAddress,
                    icon: Icons.person,
                    onChanged: (val) {},
                  ),
                  const SizedBox(height: 20),
                  CustomPwdTile(
                    hintText: 'Password',
                    controller: _pwdController,
                    type: TextInputType.visiblePassword,
                    icon: Icons.lock,
                    onChanged: (val) {},
                    isPassword: true,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.lightTheme().primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Observer(builder: (context) {
                        final isLoading = authStore.isLoading;
                        if (isLoading) {
                          return const AppLoader();
                        }
                        return Text(
                          "Login",
                          style: AppTheme.lightTheme()
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 20),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: signupNow,
                        child: Text(
                          "Signup now!",
                          style: TextStyle(
                            color: AppTheme.lightTheme().primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
