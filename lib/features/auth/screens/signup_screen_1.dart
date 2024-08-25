import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/field_validation_function.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_text_field.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/Global/widgets/scaffold_messenger.dart';
import 'package:mess_mgmt/features/Networking/widgets/wobble_appbar.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';

import '../enums/auth_enum.dart';

class SignupScreenOne extends StatefulWidget {
  const SignupScreenOne({super.key});

  @override
  State<SignupScreenOne> createState() => _SignupScreenOneState();
}

class _SignupScreenOneState extends State<SignupScreenOne> {
  final _firstNameController = TextEditingController(text: authStore.fName);
  final _lastNameController = TextEditingController(text: authStore.lName);
  final _emailController = TextEditingController(text: authStore.email);

  void login() {
    authStore.navigateToAuthScreenScreen(AuthScreens.loginScreen);
  }

  void nextLoginScreen() {
    final fName = _firstNameController.text.trim();
    final lName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    if (!isValidate(fName)) {
      showMessage(message: 'Enter First Name', context: context);
      return;
    }
    if (!isValidate(lName)) {
      showMessage(message: 'Enter Last Name', context: context);
      return;
    }
    if (!isValidate(email)) {
      showMessage(message: 'Enter Valid Email', context: context);
      return;
    }
    authStore.navigateToAuthScreenScreen(AuthScreens.signUpScreen2);
  }

  Widget customElevatedButton(
      String action, VoidCallback ontap, double buttonWidth) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(AppTheme.lightTheme().primaryColor),
          padding:
              WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        child: Observer(builder: (context) {
          final isLoading = authStore.isLoading;
          if (isLoading) {
            return const AppLoader();
          }
          return Text(
            action,
            style: AppTheme.lightTheme()
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: 20),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  String? fName;
  String? lName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WobbleAppBar(
        title: "Creating your account",
        color: Colors.white,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppTheme.linearGradient(),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: LottieBuilder.asset(
                      'assets/lottie/login_lottie.json',
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'First name',
                    controller: _firstNameController,
                    type: TextInputType.text,
                    icon: Icons.person,
                    onChanged: (val) {
                      authStore.fName = _firstNameController.text.trim();
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hintText: 'Last name',
                    controller: _lastNameController,
                    type: TextInputType.text,
                    icon: Icons.person_2_outlined,
                    onChanged: (val) {
                      authStore.lName = _lastNameController.text.trim();
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hintText: 'E-mail id',
                    controller: _emailController,
                    type: TextInputType.emailAddress,
                    icon: Icons.email,
                    onChanged: (val) {
                      authStore.email = _emailController.text.trim();
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: nextLoginScreen,
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
                          "Next",
                          style: AppTheme.lightTheme()
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 20),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: login,
                        child: Text(
                          "Login now",
                          style: TextStyle(
                            color: AppTheme.lightTheme().primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
