import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';

class CustomPwdTile extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType type;
  final IconData icon;
  final ValueChanged<String?> onChanged;

  const CustomPwdTile({
    super.key,
    required this.hintText,
    required this.controller,
    required this.type,
    required this.icon,
    required this.onChanged, required bool isPassword,
  });

  @override
  _CustomPwdTileState createState() => _CustomPwdTileState();
}

class _CustomPwdTileState extends State<CustomPwdTile> {
  bool isObscure = true;

  void pwdVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 60.0,
        maxHeight: 80.0,
      ),
      child: SizedBox(
        width: 300,
        child: TextField(
          obscureText: isObscure,
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: AppTheme.lightTheme().primaryColor,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 18),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility: Icons.visibility_off,
              ),
              onPressed: pwdVisibility,
            ),
          ),
          keyboardType: widget.type,
        ),
      ),
    );
  }
}
