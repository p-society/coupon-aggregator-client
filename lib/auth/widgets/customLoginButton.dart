import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String action;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;

  const CustomButton({
    Key? key,
    required this.action,
    required this.onPressed,
    this.color = Colors.blue,
    this.textStyle = const TextStyle(color: Colors.white),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8;
    return Container(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
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
}
