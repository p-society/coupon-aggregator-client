import 'package:flutter/material.dart';
import 'package:mess_mgmt/utils/colors.dart';
import 'package:pinput/pinput.dart';

class Otpverificationscreen extends StatefulWidget {
  const Otpverificationscreen({super.key});

  @override
  State<Otpverificationscreen> createState() => _OtpverificationscreenState();
}

class _OtpverificationscreenState extends State<Otpverificationscreen> {
  void verify(BuildContext context) {
    Navigator.pushNamed(context, "/dashboard");
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 68,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColor.backgroundColor,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "OTP Verification",
          style: TextStyle(
            color: Color.fromARGB(249, 0, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Pinput(
            length: 4,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: Colors.grey),
              ),
            ),
            onCompleted: (pin) => debugPrint(pin),
          ),
        ),
      ),
    );
  }
}
