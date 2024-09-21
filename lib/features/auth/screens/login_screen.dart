import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/field_validation_function.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_pwd_tile.dart';
import 'package:mess_mgmt/Global/widgets/custom_text_field.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/features/auth/enums/auth_enum.dart';
import 'package:mess_mgmt/features/auth/repository/auth_repo.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';

import '../../../Global/widgets/scaffold_messenger.dart';
import '../../../features/Networking/widgets/wobble_appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AnimationController _controller;

  void login() async {
    if (!isValidate(_emailController.text)) {
      showMessage(message: "Please Enter The Email", context: context);
      return;
    }
    if (!AuthRepository.validateEmail(email: _emailController.text)) {
      showMessage(message: "Enter Your Valid College Email-Id", context: context);
      return;
    }
    if (!isValidate(_pwdController.text)) {
      showMessage(message: 'Incorrect password', context: context);
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
    // navigateAndPopToNextScreen(
    // nextScreen: const SignupScreenOne(), context: context);
    authStore.currentAuthScreen = AuthScreens.signUpScreen1;
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..forward()
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                      'assets/lottie/login_fingerprint.json',
                      frameRate: FrameRate.composition,
                      controller: _controller,
                    ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                      hintText: 'Enter your email Id',
                      controller: _emailController,
                      type: TextInputType.emailAddress,
                      icon: Icons.person_rounded,
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
