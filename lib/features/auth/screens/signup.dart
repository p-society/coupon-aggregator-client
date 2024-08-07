import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmPwdController = TextEditingController();

  void login() {
    Navigator.pushNamed(context, "/dashboard");
  }

  void signupNow() {
    Navigator.pushNamed(context, "/signup");
  }

  Widget customElevatedButton(
      String action, VoidCallback ontap, double buttonWidth) {
    return SizedBox(
      width: buttonWidth,
      child: TextButton(
        onPressed: ontap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color.fromARGB(249, 0,
              0, 0)), // Corrected WidgetStateProperty to MaterialStateProperty
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
              vertical:
                  12)), // Corrected WidgetStateProperty to MaterialStateProperty
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
            const SizedBox(height: 30,),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _confirmPwdController,
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
            const SizedBox(height: 30),
            customElevatedButton("Signup", signupNow, buttonWidth),
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
                  onPressed: login,
                  child: const Text("Login now"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
