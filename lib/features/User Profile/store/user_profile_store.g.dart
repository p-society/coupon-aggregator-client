// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserProfileStore on UserProfile, Store {
  Computed<PaginationEnum>? _$currentPaginationComputed;

  @override
  PaginationEnum get currentPagination => (_$currentPaginationComputed ??=
          Computed<PaginationEnum>(() => super.currentPagination,
              name: 'UserProfile.currentPagination'))
      .value;

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

  late final _$isLoadingLocallyAtom =
      Atom(name: 'UserProfile.isLoadingLocally', context: context);

  @override
  bool get isLoadingLocally {
    _$isLoadingLocallyAtom.reportRead();
    return super.isLoadingLocally;
  }

  @override
  set isLoadingLocally(bool value) {
    _$isLoadingLocallyAtom.reportWrite(value, super.isLoadingLocally, () {
      super.isLoadingLocally = value;
    });
  }

  late final _$isCouponLoadedAtom =
      Atom(name: 'UserProfile.isCouponLoaded', context: context);

  @override
  bool get isCouponLoaded {
    _$isCouponLoadedAtom.reportRead();
    return super.isCouponLoaded;
  }

  @override
  set isCouponLoaded(bool value) {
    _$isCouponLoadedAtom.reportWrite(value, super.isCouponLoaded, () {
      super.isCouponLoaded = value;
    });
  }

  late final _$isPaginationLoadingAtom =
      Atom(name: 'UserProfile.isPaginationLoading', context: context);

  @override
  bool get isPaginationLoading {
    _$isPaginationLoadingAtom.reportRead();
    return super.isPaginationLoading;
  }

  @override
  set isPaginationLoading(bool value) {
    _$isPaginationLoadingAtom.reportWrite(value, super.isPaginationLoading, () {
      super.isPaginationLoading = value;
    });
  }

  late final _$totalAtom = Atom(name: 'UserProfile.total', context: context);

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$fetchSellingCouponListAsyncAction =
      AsyncAction('UserProfile.fetchSellingCouponList', context: context);

  @override
  Future<dynamic> fetchSellingCouponList() {
    return _$fetchSellingCouponListAsyncAction
        .run(() => super.fetchSellingCouponList());
  }

  late final _$deleteCouponAsyncAction =
      AsyncAction('UserProfile.deleteCoupon', context: context);

  @override
  Future<dynamic> deleteCoupon({required CouponDataModel coupon}) {
    return _$deleteCouponAsyncAction
        .run(() => super.deleteCoupon(coupon: coupon));
  }

  late final _$updateCouponAsyncAction =
      AsyncAction('UserProfile.updateCoupon', context: context);

  @override
  Future<dynamic> updateCoupon({required CouponDataModel coupon}) {
    return _$updateCouponAsyncAction
        .run(() => super.updateCoupon(coupon: coupon));
  }

  late final _$skipLoadMoreAsyncAction =
      AsyncAction('UserProfile.skipLoadMore', context: context);

  @override
  Future<dynamic> skipLoadMore() {
    return _$skipLoadMoreAsyncAction.run(() => super.skipLoadMore());
  }

  late final _$UserProfileActionController =
      ActionController(name: 'UserProfile', context: context);

  @override
  void updateCouponLocally({required CouponDataModel coupon}) {
    final _$actionInfo = _$UserProfileActionController.startAction(
        name: 'UserProfile.updateCouponLocally');
    try {
      return super.updateCouponLocally(coupon: coupon);
    } finally {
      _$UserProfileActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userSellingCouponsList: ${userSellingCouponsList},
isLoading: ${isLoading},
isLoadingLocally: ${isLoadingLocally},
isCouponLoaded: ${isCouponLoaded},
isPaginationLoading: ${isPaginationLoading},
total: ${total},
currentPagination: ${currentPagination}
    ''';
  }
}
