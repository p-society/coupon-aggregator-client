import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custome_app_bar_widget.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';
import 'package:mess_mgmt/features/dashboard/screens/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();

  void login() {
    authStore.userSignUp(userData: {});
    // Navigator.pushNamed(context, "/dashboard");
  }

  void signupNow() {
    navigateToNextScreen(nextScreen: const DashboardScreen(), context: context);
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
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 60.0,
                          maxHeight: 80.0,
                        ),
                        child: SizedBox(
                          width: 300,
                          child: TextField(
                            maxLines: null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email,
                                  color: AppTheme.lightTheme().primaryColor),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "E-mail id",
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 5,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _pwdController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,
                                color: AppTheme.lightTheme().primaryColor),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Password",
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(height: 30),
                      customElevatedButton("Login", login, buttonWidth),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: signupNow,
                            child: const Text("Signup Now"),
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
