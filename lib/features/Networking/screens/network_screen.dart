import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: LottieBuilder.asset(
                'assets/lottie/oops_anim.json',
              ),
            ),
            const Text("Oops, please conect to the internet",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
