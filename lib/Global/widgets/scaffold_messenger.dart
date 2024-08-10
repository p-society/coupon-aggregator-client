import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void showMessage({required String message,required  BuildContext context}){
   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: CupertinoColors.systemGrey.withOpacity(0.95),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                ),
              );
}