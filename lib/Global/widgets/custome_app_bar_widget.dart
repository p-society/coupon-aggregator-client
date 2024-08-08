import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoundedAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withOpacity(0.2),
      child: Container(
        height: preferredSize.height,
        decoration: BoxDecoration(
          color: AppTheme.lightTheme().primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            'Welcome Back !',
            style: AppTheme.lightTheme().textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
          ),
        ),
      ),
    );
  }
}
