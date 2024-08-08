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

  late final _$breakfastListAtom =
      Atom(name: 'Dashboard.breakfastList', context: context);

  @override
  ObservableList<CouponModel> get breakfastList {
    _$breakfastListAtom.reportRead();
    return super.breakfastList;
  }

  @override
  set breakfastList(ObservableList<CouponModel> value) {
    _$breakfastListAtom.reportWrite(value, super.breakfastList, () {
      super.breakfastList = value;
    });
  }

  late final _$lunchListAtom =
      Atom(name: 'Dashboard.lunchList', context: context);

  @override
  ObservableList<CouponModel> get lunchList {
    _$lunchListAtom.reportRead();
    return super.lunchList;
  }

  @override
  set lunchList(ObservableList<CouponModel> value) {
    _$lunchListAtom.reportWrite(value, super.lunchList, () {
      super.lunchList = value;
    });
  }

  late final _$dinnerListAtom =
      Atom(name: 'Dashboard.dinnerList', context: context);

  @override
  ObservableList<CouponModel> get dinnerList {
    _$dinnerListAtom.reportRead();
    return super.dinnerList;
  }

  @override
  set dinnerList(ObservableList<CouponModel> value) {
    _$dinnerListAtom.reportWrite(value, super.dinnerList, () {
      super.dinnerList = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
breakfastList: ${breakfastList},
lunchList: ${lunchList},
dinnerList: ${dinnerList},
breakfastCount: ${breakfastCount},
lunchCount: ${lunchCount},
dinnerCount: ${dinnerCount}
    ''';
  }
}
