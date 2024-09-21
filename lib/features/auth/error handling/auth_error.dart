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
  String get errorDescription =>
      "It seems like you have entered wrong email or password";

  @override
  String get errorString => "Invalid Credentials !";
}

@immutable
class AuthErrorEmailAlreadyExist implements AuthError {
  const AuthErrorEmailAlreadyExist();
  @override
  String get errorDescription => "Given Email Id Already exist !";

  @override
  String get errorString => "Email Already Exist";
}

@immutable
class AuthErrorMobileNumberAlreadyExist implements AuthError {
  const AuthErrorMobileNumberAlreadyExist();
  @override
  String get errorDescription => "Given Mobile Number is already in use !";

  @override
  String get errorString => "Mobile Number Already Registered";
}

class AuthErrorNetworkIssue implements AuthError {
  const AuthErrorNetworkIssue();

  @override
  String get errorDescription => "Please check your network and try again.";

  @override
  String get errorString => "Connection error !";
}

class AuthErrorUnknownIssue implements AuthError {
  const AuthErrorUnknownIssue();

  @override
  String get errorDescription => "Please try again .";

  @override
  String get errorString => "Something Went wrong !";
}
