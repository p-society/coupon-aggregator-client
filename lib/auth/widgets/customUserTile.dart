import 'package:flutter/material.dart';
import 'package:mess_mgmt/utils/colors.dart';

class CustomUserTile extends StatelessWidget {
  final String action;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;

  const CustomUserTile({
    Key? key,
    required this.action,
    required this.onPressed,
    this.color = Colors.blue,
    this.textStyle = const TextStyle(color: Colors.white),
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      title: Text(action,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.backgroundColor)),
      trailing: const Icon(Icons.contact_emergency_outlined,
          size: 30, color: AppColor.backgroundColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      tileColor: AppColor.tileColor,
    );
  }
}
