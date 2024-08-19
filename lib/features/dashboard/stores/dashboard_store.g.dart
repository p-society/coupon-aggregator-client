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
  Computed<List<CouponDataModel>>? _$currentViewListComputed;

  @override
  List<CouponDataModel> get currentViewList => (_$currentViewListComputed ??=
          Computed<List<CouponDataModel>>(() => super.currentViewList,
              name: 'Dashboard.currentViewList'))
      .value;
  Computed<List<CouponDataModel>>? _$getBreakfastFilteredListComputed;

  @override
  List<CouponDataModel> get getBreakfastFilteredList =>
      (_$getBreakfastFilteredListComputed ??= Computed<List<CouponDataModel>>(
              () => super.getBreakfastFilteredList,
              name: 'Dashboard.getBreakfastFilteredList'))
          .value;
  Computed<List<CouponDataModel>>? _$getLunchFilteredListComputed;

  @override
  List<CouponDataModel> get getLunchFilteredList =>
      (_$getLunchFilteredListComputed ??= Computed<List<CouponDataModel>>(
              () => super.getLunchFilteredList,
              name: 'Dashboard.getLunchFilteredList'))
          .value;
  Computed<List<CouponDataModel>>? _$getDinnerFilteredListComputed;

  @override
  List<CouponDataModel> get getDinnerFilteredList =>
      (_$getDinnerFilteredListComputed ??= Computed<List<CouponDataModel>>(
              () => super.getDinnerFilteredList,
              name: 'Dashboard.getDinnerFilteredList'))
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

  late final _$isFilterVegAtom =
      Atom(name: 'Dashboard.isFilterVeg', context: context);

  @override
  bool get isFilterVeg {
    _$isFilterVegAtom.reportRead();
    return super.isFilterVeg;
  }

  @override
  set isFilterVeg(bool value) {
    _$isFilterVegAtom.reportWrite(value, super.isFilterVeg, () {
      super.isFilterVeg = value;
    });
  }

  late final _$isFilterNonVegAtom =
      Atom(name: 'Dashboard.isFilterNonVeg', context: context);

  @override
  bool get isFilterNonVeg {
    _$isFilterNonVegAtom.reportRead();
    return super.isFilterNonVeg;
  }

  @override
  set isFilterNonVeg(bool value) {
    _$isFilterNonVegAtom.reportWrite(value, super.isFilterNonVeg, () {
      super.isFilterNonVeg = value;
    });
  }

  late final _$isFilterFirstFloorAtom =
      Atom(name: 'Dashboard.isFilterFirstFloor', context: context);

  @override
  bool get isFilterFirstFloor {
    _$isFilterFirstFloorAtom.reportRead();
    return super.isFilterFirstFloor;
  }

  @override
  set isFilterFirstFloor(bool value) {
    _$isFilterFirstFloorAtom.reportWrite(value, super.isFilterFirstFloor, () {
      super.isFilterFirstFloor = value;
    });
  }

  late final _$isFilterGroundFloorAtom =
      Atom(name: 'Dashboard.isFilterGroundFloor', context: context);

  @override
  bool get isFilterGroundFloor {
    _$isFilterGroundFloorAtom.reportRead();
    return super.isFilterGroundFloor;
  }

  @override
  set isFilterGroundFloor(bool value) {
    _$isFilterGroundFloorAtom.reportWrite(value, super.isFilterGroundFloor, () {
      super.isFilterGroundFloor = value;
    });
  }

  late final _$totalBreakfastAvailableAtom =
      Atom(name: 'Dashboard.totalBreakfastAvailable', context: context);

  @override
  int get totalBreakfastAvailable {
    _$totalBreakfastAvailableAtom.reportRead();
    return super.totalBreakfastAvailable;
  }

  @override
  set totalBreakfastAvailable(int value) {
    _$totalBreakfastAvailableAtom
        .reportWrite(value, super.totalBreakfastAvailable, () {
      super.totalBreakfastAvailable = value;
    });
  }

  late final _$totalLunchAvailableAtom =
      Atom(name: 'Dashboard.totalLunchAvailable', context: context);

  @override
  int get totalLunchAvailable {
    _$totalLunchAvailableAtom.reportRead();
    return super.totalLunchAvailable;
  }

  @override
  set totalLunchAvailable(int value) {
    _$totalLunchAvailableAtom.reportWrite(value, super.totalLunchAvailable, () {
      super.totalLunchAvailable = value;
    });
  }

  late final _$totalDinnerAvailableAtom =
      Atom(name: 'Dashboard.totalDinnerAvailable', context: context);

  @override
  int get totalDinnerAvailable {
    _$totalDinnerAvailableAtom.reportRead();
    return super.totalDinnerAvailable;
  }

  @override
  set totalDinnerAvailable(int value) {
    _$totalDinnerAvailableAtom.reportWrite(value, super.totalDinnerAvailable,
        () {
      super.totalDinnerAvailable = value;
    });
  }

  late final _$isLoadMoreAtom =
      Atom(name: 'Dashboard.isLoadMore', context: context);

  @override
  bool get isLoadMore {
    _$isLoadMoreAtom.reportRead();
    return super.isLoadMore;
  }

  @override
  set isLoadMore(bool value) {
    _$isLoadMoreAtom.reportWrite(value, super.isLoadMore, () {
      super.isLoadMore = value;
    });
  }

  late final _$currentViewAtom =
      Atom(name: 'Dashboard.currentView', context: context);

  @override
  MealTimeType get currentView {
    _$currentViewAtom.reportRead();
    return super.currentView;
  }

  @override
  set currentView(MealTimeType value) {
    _$currentViewAtom.reportWrite(value, super.currentView, () {
      super.currentView = value;
    });
  }

  late final _$loadMoreAsyncAction =
      AsyncAction('Dashboard.loadMore', context: context);

  @override
  Future<dynamic> loadMore({required MealTimeType type}) {
    return _$loadMoreAsyncAction.run(() => super.loadMore(type: type));
  }

  late final _$fetchMealAsyncAction =
      AsyncAction('Dashboard.fetchMeal', context: context);

  @override
  Future<dynamic> fetchMeal(
      {required MealTimeType type, required int mealLimit}) {
    return _$fetchMealAsyncAction
        .run(() => super.fetchMeal(type: type, mealLimit: mealLimit));
  }

  late final _$sellCouponAsyncAction =
      AsyncAction('Dashboard.sellCoupon', context: context);

  @override
  Future<dynamic> sellCoupon(CouponModel model) {
    return _$sellCouponAsyncAction.run(() => super.sellCoupon(model));
  }

  late final _$fetchAllMealsAsyncAction =
      AsyncAction('Dashboard.fetchAllMeals', context: context);

  @override
  Future<dynamic> fetchAllMeals() {
    return _$fetchAllMealsAsyncAction.run(() => super.fetchAllMeals());
  }

  late final _$DashboardActionController =
      ActionController(name: 'Dashboard', context: context);

  @override
  void increaseLimit({required MealTimeType type}) {
    final _$actionInfo = _$DashboardActionController.startAction(
        name: 'Dashboard.increaseLimit');
    try {
      return super.increaseLimit(type: type);
    } finally {
      _$DashboardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMeal({required MealTimeType mealType}) {
    final _$actionInfo =
        _$DashboardActionController.startAction(name: 'Dashboard.clearMeal');
    try {
      return super.clearMeal(mealType: mealType);
    } finally {
      _$DashboardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMeal(
      {required List<CouponDataModel> list,
      required MealTimeType type,
      required int total}) {
    final _$actionInfo =
        _$DashboardActionController.startAction(name: 'Dashboard.addMeal');
    try {
      return super.addMeal(list: list, type: type, total: total);
    } finally {
      _$DashboardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteCouponLocally({required CouponDataModel coupon}) {
    final _$actionInfo = _$DashboardActionController.startAction(
        name: 'Dashboard.deleteCouponLocally');
    try {
      return super.deleteCouponLocally(coupon: coupon);
    } finally {
      _$DashboardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCouponLocally({required CouponDataModel coupon}) {
    final _$actionInfo = _$DashboardActionController.startAction(
        name: 'Dashboard.updateCouponLocally');
    try {
      return super.updateCouponLocally(coupon: coupon);
    } finally {
      _$DashboardActionController.endAction(_$actionInfo);
    }
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
isFilterVeg: ${isFilterVeg},
isFilterNonVeg: ${isFilterNonVeg},
isFilterFirstFloor: ${isFilterFirstFloor},
isFilterGroundFloor: ${isFilterGroundFloor},
totalBreakfastAvailable: ${totalBreakfastAvailable},
totalLunchAvailable: ${totalLunchAvailable},
totalDinnerAvailable: ${totalDinnerAvailable},
isLoadMore: ${isLoadMore},
currentView: ${currentView},
breakfastCount: ${breakfastCount},
lunchCount: ${lunchCount},
dinnerCount: ${dinnerCount},
currentViewList: ${currentViewList},
getBreakfastFilteredList: ${getBreakfastFilteredList},
getLunchFilteredList: ${getLunchFilteredList},
getDinnerFilteredList: ${getDinnerFilteredList}
    ''';
  }
}
