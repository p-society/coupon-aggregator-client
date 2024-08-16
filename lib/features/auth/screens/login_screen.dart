import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
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
  final _formKey = GlobalKey<FormState>();

  Future<bool> checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void login() async {
    if (!isValidate(_emailController.text)) {
      showMessage(message: "Enter Valid Email", context: context);
      return;
    }
    // await Future.delayed(const Duration(seconds: 2));

    // bool hasConnection = await checkInternetConnection();
    // if (!hasConnection) {
    //   showMessage(message: "Check Internet Connection", context: context);
    //   return;
    // }
    if (_formKey.currentState?.validate() ?? true) {
      await authStore.userLogin(
        _emailController.text.trim(),
        _pwdController.text.trim(),
      );
    }
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      validator: (value) {
                        if (!isValidate(value)) {
                          return 'Enter a valid Email';
                        }
                        return null;
                      }),
                  const SizedBox(height: 20),
                  CustomPwdTile(
                      hintText: 'Password',
                      controller: _pwdController,
                      type: TextInputType.visiblePassword,
                      icon: Icons.lock,
                      onChanged: (val) {},
                      isPassword: true,
                      validator: (value) {
                        //validator for minimum password length
                        //to be customised according to need
                        if (value == null || value.length < 6) {
                          return 'password must be atleast 6 characters long';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 500,
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
