import 'package:flutter/material.dart';

@immutable
abstract class AuthError {
  final String errorString;
  final String errorDescription;

  const AuthError({
    required this.errorString,
    required this.errorDescription,
  });
}

@immutable
class AuthErrorUserNotFound implements AuthError {
  const AuthErrorUserNotFound();

  @override
  String get errorDescription => "The given user was not found on the server!";

  @override
  String get errorString => "User not exist";
}

@immutable
class AuthErrorEmailAlreadyExist implements AuthError {
  const AuthErrorEmailAlreadyExist();
  @override
  String get errorDescription => "Given emailid Already exist !";

  @override
  String get errorString => "Email Already Exist";
}
