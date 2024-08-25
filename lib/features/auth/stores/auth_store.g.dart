// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on Auth, Store {
  late final _$isLoadingAtom = Atom(name: 'Auth.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSuccessfullyLoggedinAtom =
      Atom(name: 'Auth.isSuccessfullyLoggedin', context: context);

  @override
  bool get isSuccessfullyLoggedin {
    _$isSuccessfullyLoggedinAtom.reportRead();
    return super.isSuccessfullyLoggedin;
  }

  @override
  set isSuccessfullyLoggedin(bool value) {
    _$isSuccessfullyLoggedinAtom
        .reportWrite(value, super.isSuccessfullyLoggedin, () {
      super.isSuccessfullyLoggedin = value;
    });
  }

  late final _$isSuccessfullySignedUpAtom =
      Atom(name: 'Auth.isSuccessfullySignedUp', context: context);

  @override
  bool get isSuccessfullySignedUp {
    _$isSuccessfullySignedUpAtom.reportRead();
    return super.isSuccessfullySignedUp;
  }

  @override
  set isSuccessfullySignedUp(bool value) {
    _$isSuccessfullySignedUpAtom
        .reportWrite(value, super.isSuccessfullySignedUp, () {
      super.isSuccessfullySignedUp = value;
    });
  }

  late final _$currentAuthScreenAtom =
      Atom(name: 'Auth.currentAuthScreen', context: context);

  @override
  AuthScreens get currentAuthScreen {
    _$currentAuthScreenAtom.reportRead();
    return super.currentAuthScreen;
  }

  @override
  set currentAuthScreen(AuthScreens value) {
    _$currentAuthScreenAtom.reportWrite(value, super.currentAuthScreen, () {
      super.currentAuthScreen = value;
    });
  }

  late final _$fNameAtom = Atom(name: 'Auth.fName', context: context);

  @override
  String get fName {
    _$fNameAtom.reportRead();
    return super.fName;
  }

  @override
  set fName(String value) {
    _$fNameAtom.reportWrite(value, super.fName, () {
      super.fName = value;
    });
  }

  late final _$lNameAtom = Atom(name: 'Auth.lName', context: context);

  @override
  String get lName {
    _$lNameAtom.reportRead();
    return super.lName;
  }

  @override
  set lName(String value) {
    _$lNameAtom.reportWrite(value, super.lName, () {
      super.lName = value;
    });
  }

  late final _$emailAtom = Atom(name: 'Auth.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom = Atom(name: 'Auth.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$mobileNumberAtom =
      Atom(name: 'Auth.mobileNumber', context: context);

  @override
  String get mobileNumber {
    _$mobileNumberAtom.reportRead();
    return super.mobileNumber;
  }

  @override
  set mobileNumber(String value) {
    _$mobileNumberAtom.reportWrite(value, super.mobileNumber, () {
      super.mobileNumber = value;
    });
  }

  late final _$userLoginAsyncAction =
      AsyncAction('Auth.userLogin', context: context);

  @override
  Future<dynamic> userLogin(String email, String password) {
    return _$userLoginAsyncAction.run(() => super.userLogin(email, password));
  }

  late final _$userSignUpAsyncAction =
      AsyncAction('Auth.userSignUp', context: context);

  @override
  Future<dynamic> userSignUp() {
    return _$userSignUpAsyncAction.run(() => super.userSignUp());
  }

  late final _$logoutAsyncAction = AsyncAction('Auth.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$AuthActionController =
      ActionController(name: 'Auth', context: context);

  @override
  void navigateToAuthScreenScreen(AuthScreens authScreen) {
    final _$actionInfo = _$AuthActionController.startAction(
        name: 'Auth.navigateToAuthScreenScreen');
    try {
      return super.navigateToAuthScreenScreen(authScreen);
    } finally {
      _$AuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSuccessfullyLoggedin: ${isSuccessfullyLoggedin},
isSuccessfullySignedUp: ${isSuccessfullySignedUp},
currentAuthScreen: ${currentAuthScreen},
fName: ${fName},
lName: ${lName},
email: ${email},
password: ${password},
mobileNumber: ${mobileNumber}
    ''';
  }
}
