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
import 'package:mess_mgmt/features/auth/enums/auth_enum.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';

class SignupScreenTwo extends StatefulWidget {
  const SignupScreenTwo({
    super.key,
  });
  @override
  State<SignupScreenTwo> createState() => _SignupScreenTwoState();
}

class _SignupScreenTwoState extends State<SignupScreenTwo> {
  final _phoneNumberController =
      TextEditingController(text: authStore.mobileNumber);
  final _pwdController = TextEditingController(text: authStore.password);

  void login() {
        navigateToNextScreen(nextScreen: const LoginScreen(), context: context);
  }

  void signupNow() async {
    if (!isValidate(_phoneNumberController.text)) {
      showMessage(message: 'Please Enter Valid Phone Number', context: context);
      return;
    }
    if (!isValidate(_pwdController.text)) {
      showMessage(message: 'Please Enter Password', context: context);
      return;
    }
    if (_pwdController.text.length < 6) {
      showMessage(
          message: 'Password length should be greater than 6 characters.',
          context: context);
      return;
    }
    await authStore.userSignUp();
  }

  void showValidateDialog(BuildContext context, Builder builder) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,             child: BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 10, sigmaY: 10),               child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.2),                   borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white
                        .withOpacity(0.3),                     width: 1.5,
                  ),
                ),
                child: const Text("Account created"),
              ),
            ),
          );
        });
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
    _phoneNumberController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 300;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: const Text('One more step'),
        leading: IconButton(
            onPressed: () {
              authStore.navigateToAuthScreenScreen(AuthScreens.signUpScreen1);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppTheme.linearGradient(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: LottieBuilder.asset(
                          'assets/lottie/login_lottie.json',
                        ),
                      ),
                      CustomTextField(
                        hintText: 'Phone number',
                        controller: _phoneNumberController,
                        type: TextInputType.phone,
                        icon: Icons.phone,
                        onChanged: (val) {
                          authStore.mobileNumber =
                              _phoneNumberController.text.trim();
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomPwdTile(
                        hintText: 'Password',
                        controller: _pwdController,
                        type: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        onChanged: (val) {
                          authStore.password = _pwdController.text.trim();
                        },
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      customElevatedButton("Signup", signupNow, buttonWidth),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
