import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/field_validation_function.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_text_field.dart';
import 'package:mess_mgmt/Global/widgets/custome_app_bar_widget.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/Global/widgets/scaffold_messenger.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
import 'package:mess_mgmt/features/auth/screens/signup_screen_2.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';

class SignupScreenOne extends StatefulWidget {
  const SignupScreenOne({super.key});

  @override
  _SignupScreenOneState createState() => _SignupScreenOneState();
}

class _SignupScreenOneState extends State<SignupScreenOne> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  void login() {
    /* authStore.userSignUp(userData: {}); */
    // Navigator.pushNamed(context, "/dashboard");
    navigateToNextScreen(nextScreen: const LoginScreen(), context: context);
  }

  /* void signupNow() {
    navigateToNextScreen(nextScreen: const DashboardScreen(), context: context);
  }
 */
  void nextLoginScreen() {
    if (!isValidate(fName)) {
      showMessage(message: 'Enter First Name', context: context);
      return;
    }
    if(!isValidate(lName)){
      showMessage(message: 'Enter Last Name', context: context);
      return;
    }
    navigateAndPopToNextScreen(
        nextScreen:  SignupScreenTwo(fName: fName!,lName: lName!,), context: context);
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
    super.dispose();
  }

  String? fName;
  String? lName;

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
                          'assets/lottie/signup_anim.json',
                        ),
                      ),
                      CustomTextField(
                        hintText: 'First name',
                        controller: _firstNameController,
                        type: TextInputType.text,
                        icon: Icons.person,
                        onChanged: (val) {
                          setState(() {
                            fName = val;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Last name',
                        controller: _lastNameController,
                        type: TextInputType.visiblePassword,
                        icon: Icons.person_outline,
                        onChanged: (val) {
                          setState(() {
                            lName = val;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      customElevatedButton(
                          "Next", nextLoginScreen, buttonWidth),
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
