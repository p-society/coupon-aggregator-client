import 'package:flutter/material.dart';
import 'package:mess_mgmt/utils/colors.dart';

class NextLoginScreen extends StatefulWidget {
  const NextLoginScreen({super.key});

  @override
  State<NextLoginScreen> createState() => _NextSignupState();
}

class _NextSignupState extends State<NextLoginScreen> {
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();

  void getOTP() {
    Navigator.pushNamed(context, "/otpVerificationScreen");
  }

  void loginNow() {
    Navigator.pushNamed(context, "/login");
  }

  Widget customElevatedButton(
      String action, VoidCallback ontap, double buttonWidth) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color.fromARGB(249, 0,
              0, 0)), 
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
              vertical:
                  12)),
        ),
        child: Text(
          action,
          style: const TextStyle(
            color: Color.fromARGB(249, 255, 255, 255),
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Signup",
          style: TextStyle(
            color: Color.fromARGB(249, 0, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "E-mail id",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _pwdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Password",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Phone Number",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              height: 30,
            ),
            customElevatedButton("Get OTP", getOTP, buttonWidth),
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
                  onPressed: loginNow,
                  child: const Text(
                    "Login Now",
                    style: TextStyle(color: AppColor.backgroundColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
