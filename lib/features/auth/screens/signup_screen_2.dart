import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/field_validation_function.dart';
import 'package:mess_mgmt/Global/Functions/my_error_dialog.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_pwd_tile.dart';
import 'package:mess_mgmt/Global/widgets/custom_text_field.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/Global/widgets/scaffold_messenger.dart';
import 'package:mess_mgmt/features/Networking/widgets/wobbleAppbar.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_1.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';

class SignupScreenTwo extends StatefulWidget {
  const SignupScreenTwo({
    super.key,
    required this.fName,
    required this.lName,
    required this.email,
  });
  final String fName;
  final String lName;
  final String email;
  @override
  State<SignupScreenTwo> createState() => _SignupScreenTwoState();
}

class _SignupScreenTwoState extends State<SignupScreenTwo>
    with SingleTickerProviderStateMixin {
  final _phoneNumberController = TextEditingController();
  final _pwdController = TextEditingController();
  late AnimationController _controller;

  void login() {
    /* authStore.userSignUp(userData: {}); */
    // Navigator.pushNamed(context, "/dashboard");
    navigateToNextScreen(nextScreen: const LoginScreen(), context: context);
  }

  void previousScreen() {
    navigateToNextScreen(nextScreen: SignupScreenOne(), context: context);
  }

  void signupNow() {
    if (!isValidate(_phoneNumberController.text)) {
      showMyMessage(
          message: 'Please enter a valid phone number', context: context);
      return;
    }
    if (!isValidate(_pwdController.text)) {
      showMyMessage(message: 'Please enter password', context: context);
      return;
    }
    if (_pwdController.text.length < 6) {
      showMyMessage(
          message: 'Password length must be 6 characters.', context: context);
      return;
    }
    authStore.userSignUp(
      userData: {
        "fName": widget.fName,
        "lName": widget.lName,
        "email": widget.email,
        "password": _pwdController.text.trim(),
        "mobileNumber": _phoneNumberController.text.trim()
      },
    );
    showValidateDialog(context, Builder(builder: (context) => Container()));
  }

  void showValidateDialog(BuildContext context, Builder builder) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor:
                  Colors.transparent, // Make background transparent
              child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10, sigmaY: 10), // Apply blur effect
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.2), // Slightly opaque background
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(
                            0.3), // White border with slight opacity
                        width: 1.5,
                      ),
                    ),
                    child: const Text("Account created"),
                  )));
        });
  }

  Widget customElevatedButton(
      String action, VoidCallback ontap, double buttonWidth,
      {WidgetStateProperty<Color?>? tileColor,
      WidgetStateProperty<Color?>? textColor}) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor: tileColor ??
              WidgetStateProperty.all(AppTheme.lightTheme().primaryColor),
          foregroundColor: textColor,
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
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          ..forward()
          ..repeat();
    super.initState();
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
      appBar: const WobbleAppBar(
        title: "One more step",
        color: Colors.white,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: LottieBuilder.asset(
                          'assets/lottie/login_lottie.json',
                          controller: _controller,
                          frameRate: const FrameRate(100),
                        ),
                      ),
                      CustomTextField(
                        hintText: 'Phone number',
                        controller: _phoneNumberController,
                        type: TextInputType.phone,
                        icon: Icons.phone,
                        onChanged: (val) {},
                      ),
                      const SizedBox(height: 30),
                      CustomPwdTile(
                        hintText: 'Password',
                        controller: _pwdController,
                        type: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        onChanged: (val) {},
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      customElevatedButton("Back", previousScreen, buttonWidth,
                          tileColor: WidgetStatePropertyAll(Colors.grey)),
                      SizedBox(
                        height: 10,
                      ),
                      customElevatedButton("Signup", signupNow, buttonWidth),
                      const SizedBox(height: 30),
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
