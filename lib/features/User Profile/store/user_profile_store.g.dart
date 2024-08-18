// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserProfileStore on UserProfile, Store {
  late final _$userSellingCouponsListAtom =
      Atom(name: 'UserProfile.userSellingCouponsList', context: context);

  @override
  ObservableList<CouponDataModel> get userSellingCouponsList {
    _$userSellingCouponsListAtom.reportRead();
    return super.userSellingCouponsList;
  }

  @override
  set userSellingCouponsList(ObservableList<CouponDataModel> value) {
    _$userSellingCouponsListAtom
        .reportWrite(value, super.userSellingCouponsList, () {
      super.userSellingCouponsList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'UserProfile.isLoading', context: context);

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

  late final _$getSellingCouponListAsyncAction =
      AsyncAction('UserProfile.getSellingCouponList', context: context);

  @override
  Future<dynamic> getSellingCouponList() {
    return _$getSellingCouponListAsyncAction
        .run(() => super.getSellingCouponList());
  }

  late final _$deleteCouponAsyncAction =
      AsyncAction('UserProfile.deleteCoupon', context: context);

  @override
  Future<dynamic> deleteCoupon({required CouponDataModel coupon}) {
    return _$deleteCouponAsyncAction
        .run(() => super.deleteCoupon(coupon: coupon));
  }

  @override
  String toString() {
    return '''
userSellingCouponsList: ${userSellingCouponsList},
isLoading: ${isLoading}
    ''';
  }
}
