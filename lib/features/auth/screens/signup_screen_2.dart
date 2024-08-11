import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/Functions/field_validation_function.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_pwd_tile.dart';
import 'package:mess_mgmt/Global/widgets/custom_text_field.dart';
import 'package:mess_mgmt/Global/widgets/custome_app_bar_widget.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/Global/widgets/scaffold_messenger.dart';
import 'package:mess_mgmt/features/Networking/widgets/wobbleAppbar.dart';
import 'package:mess_mgmt/features/auth/screens/login_screen.dart';
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

class _SignupScreenTwoState extends State<SignupScreenTwo> {
  final _phoneNumberController = TextEditingController();
  final _pwdController = TextEditingController();

  void login() {
    /* authStore.userSignUp(userData: {}); */
    // Navigator.pushNamed(context, "/dashboard");
    navigateToNextScreen(nextScreen: const LoginScreen(), context: context);
  }

  void signupNow() {
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
    authStore.userSignUp(
      userData: {
        "fName": widget.fName,
        "lName": widget.lName,
        "email": widget.email,
        "password": _pwdController.text.trim(),
        "mobileNumber": _phoneNumberController.text.trim()
      },
    );
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
                      CustomPwdTile(
                        hintText: 'Password',
                        controller: _pwdController,
                        type: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        onChanged: (val) {},
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
