// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppStateStore, Store {
  late final _$jwtAtom = Atom(name: '_AppStateStore.jwt', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_AppStateStore.isLoading', context: context);

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

  late final _$isExpireAtom =
      Atom(name: '_AppStateStore.isExpire', context: context);

  @override
  bool get isExpire {
    _$isExpireAtom.reportRead();
    return super.isExpire;
  }

  @override
  set isExpire(bool value) {
    _$isExpireAtom.reportWrite(value, super.isExpire, () {
      super.isExpire = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_AppStateStore.currentUser', context: context);

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

  late final _$authErrorAtom =
      Atom(name: '_AppStateStore.authError', context: context);

  @override
  AuthError? get authError {
    _$authErrorAtom.reportRead();
    return super.authError;
  }

  @override
  set authError(AuthError? value) {
    _$authErrorAtom.reportWrite(value, super.authError, () {
      super.authError = value;
    });
  }

  late final _$initializationAsyncAction =
      AsyncAction('_AppStateStore.initialization', context: context);

  @override
  Future<dynamic> initialization() {
    return _$initializationAsyncAction.run(() => super.initialization());
  }

  late final _$validateSessionAsyncAction =
      AsyncAction('_AppStateStore.validateSession', context: context);

  @override
  Future<dynamic> validateSession() {
    return _$validateSessionAsyncAction.run(() => super.validateSession());
  }

  @override
  String toString() {
    return '''
jwt: ${jwt},
isLoading: ${isLoading},
isExpire: ${isExpire},
currentUser: ${currentUser},
authError: ${authError}
    ''';
  }
}
