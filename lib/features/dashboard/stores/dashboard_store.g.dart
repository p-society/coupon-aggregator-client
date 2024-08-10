// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardStore on Dashboard, Store {
  Computed<int>? _$breakfastCountComputed;

  @override
  int get breakfastCount =>
      (_$breakfastCountComputed ??= Computed<int>(() => super.breakfastCount,
              name: 'Dashboard.breakfastCount'))
          .value;
  Computed<int>? _$lunchCountComputed;

  @override
  int get lunchCount => (_$lunchCountComputed ??=
          Computed<int>(() => super.lunchCount, name: 'Dashboard.lunchCount'))
      .value;
  Computed<int>? _$dinnerCountComputed;

  @override
  int get dinnerCount => (_$dinnerCountComputed ??=
          Computed<int>(() => super.dinnerCount, name: 'Dashboard.dinnerCount'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'Dashboard.isLoading', context: context);

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

  late final _$totalAvailableCouponAtom =
      Atom(name: 'Dashboard.totalAvailableCoupon', context: context);

  @override
  int? get totalAvailableCoupon {
    _$totalAvailableCouponAtom.reportRead();
    return super.totalAvailableCoupon;
  }

  @override
  set totalAvailableCoupon(int? value) {
    _$totalAvailableCouponAtom.reportWrite(value, super.totalAvailableCoupon,
        () {
      super.totalAvailableCoupon = value;
    });
  }

  late final _$breakfastListAtom =
      Atom(name: 'Dashboard.breakfastList', context: context);

  @override
  ObservableList<CouponDataModel> get breakfastList {
    _$breakfastListAtom.reportRead();
    return super.breakfastList;
  }

  @override
  set breakfastList(ObservableList<CouponDataModel> value) {
    _$breakfastListAtom.reportWrite(value, super.breakfastList, () {
      super.breakfastList = value;
    });
  }

  late final _$lunchListAtom =
      Atom(name: 'Dashboard.lunchList', context: context);

  @override
  ObservableList<CouponDataModel> get lunchList {
    _$lunchListAtom.reportRead();
    return super.lunchList;
  }

  @override
  set lunchList(ObservableList<CouponDataModel> value) {
    _$lunchListAtom.reportWrite(value, super.lunchList, () {
      super.lunchList = value;
    });
  }

  late final _$dinnerListAtom =
      Atom(name: 'Dashboard.dinnerList', context: context);

  @override
  ObservableList<CouponDataModel> get dinnerList {
    _$dinnerListAtom.reportRead();
    return super.dinnerList;
  }

  @override
  set dinnerList(ObservableList<CouponDataModel> value) {
    _$dinnerListAtom.reportWrite(value, super.dinnerList, () {
      super.dinnerList = value;
    });
  }

  late final _$breakfastLimitAtom =
      Atom(name: 'Dashboard.breakfastLimit', context: context);

  @override
  int get breakfastLimit {
    _$breakfastLimitAtom.reportRead();
    return super.breakfastLimit;
  }

  @override
  set breakfastLimit(int value) {
    _$breakfastLimitAtom.reportWrite(value, super.breakfastLimit, () {
      super.breakfastLimit = value;
    });
  }

  late final _$lunchLimitAtom =
      Atom(name: 'Dashboard.lunchLimit', context: context);

  @override
  int get lunchLimit {
    _$lunchLimitAtom.reportRead();
    return super.lunchLimit;
  }

  @override
  set lunchLimit(int value) {
    _$lunchLimitAtom.reportWrite(value, super.lunchLimit, () {
      super.lunchLimit = value;
    });
  }

  late final _$dinnerLimitAtom =
      Atom(name: 'Dashboard.dinnerLimit', context: context);

  @override
  int get dinnerLimit {
    _$dinnerLimitAtom.reportRead();
    return super.dinnerLimit;
  }

  @override
  set dinnerLimit(int value) {
    _$dinnerLimitAtom.reportWrite(value, super.dinnerLimit, () {
      super.dinnerLimit = value;
    });
  }

  late final _$fetchListCouponAsyncAction =
      AsyncAction('Dashboard.fetchListCoupon', context: context);

  @override
  Future<dynamic> fetchListCoupon() {
    return _$fetchListCouponAsyncAction.run(() => super.fetchListCoupon());
  }

  late final _$fetchBreakfastAsyncAction =
      AsyncAction('Dashboard.fetchBreakfast', context: context);

  @override
  Future<dynamic> fetchBreakfast(int limit) {
    return _$fetchBreakfastAsyncAction.run(() => super.fetchBreakfast(limit));
  }

  late final _$sellCouponAsyncAction =
      AsyncAction('Dashboard.sellCoupon', context: context);

  @override
  Future<dynamic> sellCoupon(CouponModel model) {
    return _$sellCouponAsyncAction.run(() => super.sellCoupon(model));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
totalAvailableCoupon: ${totalAvailableCoupon},
breakfastList: ${breakfastList},
lunchList: ${lunchList},
dinnerList: ${dinnerList},
breakfastLimit: ${breakfastLimit},
lunchLimit: ${lunchLimit},
dinnerLimit: ${dinnerLimit},
breakfastCount: ${breakfastCount},
lunchCount: ${lunchCount},
dinnerCount: ${dinnerCount}
    ''';
  }
}
