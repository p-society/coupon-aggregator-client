import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_text_field.dart';
import 'package:mess_mgmt/Global/widgets/custome_app_bar_widget.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';
import 'package:mess_mgmt/features/dashboard/screens/dashboard.dart';

class SignupScreenTwo extends StatefulWidget {
  const SignupScreenTwo({super.key});

  @override
  State<SignupScreenTwo> createState() => _SignupScreenTwoState();
}

class _SignupScreenTwoState extends State<SignupScreenTwo> {
  final _phoneNumberController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void login() {
    /* authStore.userSignUp(userData: {}); */
    // Navigator.pushNamed(context, "/dashboard");
    navigateToNextScreen(nextScreen: const LoginScreen(), context: context);
  }

  void signupNow() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) =>const DashboardScreen(),
      ),
      (r) => false,
    );
    // navigateToNextScreen(nextScreen: const DashboardScreen(), context: context);
  }

  /* void nextLoginScreen() {
    navigateToNextScreen(nextScreen: const SignupScreenTwo(), context: context);
  } */

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
      appBar: const RoundedAppBar(),
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
                        onChanged: (val) {},
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Password',
                        controller: _pwdController,
                        type: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        onChanged: (val) {},
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Confirm Password',
                        controller: _confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        onChanged: (val) {},
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      customElevatedButton("Sign up", signupNow, buttonWidth),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: login,
                            child: const Text("Login Now"),
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
