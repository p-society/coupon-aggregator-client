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

  late final _$jwtAtom = Atom(name: 'Auth.jwt', context: context);

  @override
  String? get jwt {
    _$jwtAtom.reportRead();
    return super.jwt;
  }

  @override
  set jwt(String? value) {
    _$jwtAtom.reportWrite(value, super.jwt, () {
      super.jwt = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: 'Auth.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
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
  Future<dynamic> userSignUp({required Map<String, dynamic> userData}) {
    return _$userSignUpAsyncAction
        .run(() => super.userSignUp(userData: userData));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
jwt: ${jwt},
currentUser: ${currentUser}
    ''';
  }
}
