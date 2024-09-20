import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const RoundedAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(110);

  Widget appBarText(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: AppTheme.lightTheme().textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
    );
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 18.0), // Adjust the padding to control spacing from the bottom
                child: appBarText(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
