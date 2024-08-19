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
class AuthErrorInvalidCredentails implements AuthError {
  const AuthErrorInvalidCredentails();
  @override
  String get errorDescription => "Invalid Credentials";

  @override
  String get errorString => "It seems like you have entered wrong email or password";
}

@immutable
class AuthErrorEmailAlreadyExist implements AuthError {
  const AuthErrorEmailAlreadyExist();
  @override
  String get errorDescription => "Given emailid Already exist !";

  @override
  String get errorString => "Email Already Exist";
}

class AuthErrorNetworkIssue implements AuthError {
  const AuthErrorNetworkIssue();

  @override
  String get errorDescription => "Connection error !";

  @override
  String get errorString => "Please check your network and try again.";
}


class AuthErrorUnknownIssue implements AuthError {
  const AuthErrorUnknownIssue();

  @override
  String get errorDescription => "Oops , Something Went wrong !";

  @override
  String get errorString => "Please try again .";
}
