import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType type;
  final IconData icon;
  final ValueChanged<String?> onChanged;
  final bool isObscure;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.type,
    required this.icon,
    required this.onChanged,
    this.isObscure = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final suffixIcon = isPassword
        ? IconButton(
            icon: isObscure
                ? const Icon(Icons.visibility)
                : const Icon(
                    Icons.visibility_off,
                  ),
            onPressed: () {},
          )
        : null;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 60.0,
        maxHeight: 80.0,
      ),
      child: SizedBox(
        width: 300,
        child: TextField(
          maxLines: null,
          obscureText: isObscure,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: AppTheme.lightTheme().primaryColor,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5,
            ),
            suffixIcon: suffixIcon,
          ),
          keyboardType: type,
        ),
      ),
    );
  }
}
