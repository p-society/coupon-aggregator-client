import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_endpoints.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_helper.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/models/coupon_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/features/User%20Profile/store/user_profile_store.dart';
import 'package:mess_mgmt/features/auth/error%20handling/auth_error.dart';
import 'package:mobx/mobx.dart';

import '../../../Global/enums/pagination_enum.dart';

part 'dashboard_store.g.dart';

final DashboardStore dashboardStore = DashboardStore();

class DashboardStore = Dashboard with _$DashboardStore;

abstract class Dashboard with Store {
  @observable
  bool isLoading = false;

  @observable
  int? totalAvailableCoupon;

  @observable
  ObservableList<CouponDataModel> breakfastList =
      ObservableList<CouponDataModel>();

  @observable
  ObservableList<CouponDataModel> lunchList = ObservableList<CouponDataModel>();

  @observable
  ObservableList<CouponDataModel> dinnerList =
      ObservableList<CouponDataModel>();

  @observable
  ObservableList<CouponDataModel> userList = ObservableList<CouponDataModel>();

  @observable
  int breakfastLimit = 10;

  @observable
  int lunchLimit = 10;

  @observable
  int dinnerLimit = 10;

  @observable
  bool isFilterVeg = false;

  @observable
  bool isFilterNonVeg = false;

  @observable
  bool isFilterFirstFloor = false;

  @observable
  bool isFilterGroundFloor = false;

  @observable
  int totalBreakfastAvailable = 0;

  @observable
  int totalLunchAvailable = 0;

  @observable
  int totalDinnerAvailable = 0;

  @computed
  int get currentViewPageTotal {
    switch (currentView) {
      case MealTimeType.breakfast:
        return totalBreakfastAvailable;
      case MealTimeType.lunch:
        return totalLunchAvailable;
      case MealTimeType.dinner:
        return totalDinnerAvailable;
    }
  }

  @observable
  DateTime date = DateTime.now();

  @observable
  bool isLoadMore = false;

  @observable
  bool isCouponLoaded = true;

  @observable
  MealTimeType currentView = MealTimeType.breakfast;

  @computed
  int get breakfastCount => breakfastList.length;

  @computed
  int get lunchCount => lunchList.length;

  @computed
  int get dinnerCount => dinnerList.length;

  @observable
  bool isPaginationLoading = false;

  @computed
  PaginationEnum get currentPagination {
    if (isFilterApplied) {
      if (dashboardStore.currentViewPageTotal == currentTotal) {
        return PaginationEnum.empty;
      }
      return PaginationEnum.initial;
    }
    if (dashboardStore.currentViewPageTotal == currentViewList.length) {
      return PaginationEnum.empty;
    }
    return PaginationEnum.initial;
  }

  @computed
  int get currentTotal {
    switch (currentView) {
      case MealTimeType.breakfast:
        return breakfastCount;
      case MealTimeType.lunch:
        return lunchCount;
      case MealTimeType.dinner:
        return dinnerCount;
    }
  }

  @computed
  bool get isFilterApplied {
    if (isFilterVeg ||
        isFilterFirstFloor ||
        isFilterGroundFloor ||
        isFilterNonVeg) {
      return true;
    }
    return false;
  }

  @computed
  List<CouponDataModel> get currentViewList {
    switch (dashboardStore.currentView) {
      case MealTimeType.breakfast:
        return dashboardStore.getBreakfastFilteredList;

      case MealTimeType.lunch:
        return dashboardStore.getLunchFilteredList;

      case MealTimeType.dinner:
        return dashboardStore.getDinnerFilteredList;
    }
  }

  @computed
  List<CouponDataModel> get getBreakfastFilteredList {
    List<Function(CouponDataModel)> filters = [
      if (!isFilterGroundFloor || !isFilterFirstFloor) ...[
        if (!(!isFilterGroundFloor && !isFilterFirstFloor)) ...[
          (CouponDataModel model) => isFilterGroundFloor
              ? model.couponFloor == 1
              : model.couponFloor == 2,
        ],
      ],
      if (!isFilterVeg || !isFilterNonVeg) ...[
        if (!(!isFilterVeg && !isFilterNonVeg)) ...[
          (CouponDataModel model) => isFilterVeg ? model.isVeg : !model.isVeg,
        ],
      ],
    ];

    List<CouponDataModel> filteredMealList = breakfastList
        .where((meal) => filters.every((filter) => filter(meal)))
        .toList();

    return filteredMealList;
  }

  @computed
  List<CouponDataModel> get getLunchFilteredList {
    List<Function(CouponDataModel)> filters = [
      if (!isFilterGroundFloor || !isFilterFirstFloor) ...[
        if (!(!isFilterGroundFloor && !isFilterFirstFloor)) ...[
          (CouponDataModel model) => isFilterGroundFloor
              ? model.couponFloor == 1
              : model.couponFloor == 2,
        ],
      ],
      if (!isFilterVeg || !isFilterNonVeg) ...[
        if (!(!isFilterVeg && !isFilterNonVeg)) ...[
          (CouponDataModel model) => isFilterVeg ? model.isVeg : !model.isVeg,
        ],
      ],
    ];

    List<CouponDataModel> filteredMealList = lunchList
        .where((meal) => filters.every((filter) => filter(meal)))
        .toList();
    return filteredMealList;
  }

  @computed
  List<CouponDataModel> get getDinnerFilteredList {
    List<Function(CouponDataModel)> filters = [
      if (!isFilterGroundFloor || !isFilterFirstFloor) ...[
        if (!(!isFilterGroundFloor && !isFilterFirstFloor)) ...[
          (CouponDataModel model) => isFilterGroundFloor
              ? model.couponFloor == 1
              : model.couponFloor == 2,
        ],
      ],
      if (!isFilterVeg || !isFilterNonVeg) ...[
        if (!(!isFilterVeg && !isFilterNonVeg)) ...[
          (CouponDataModel model) => isFilterVeg ? model.isVeg : !model.isVeg,
        ],
      ],
    ];

    List<CouponDataModel> filteredMealList = dinnerList
        .where((meal) => filters.every((filter) => filter(meal)))
        .toList();

    return filteredMealList;
  }

  @action
  void increaseLimit({required MealTimeType type}) {
    switch (type) {
      case MealTimeType.breakfast:
        breakfastLimit += 10;
        break;
      case MealTimeType.lunch:
        lunchLimit += 10;
        break;
      case MealTimeType.dinner:
        dinnerLimit += 10;
        break;
    }
  }

  // @action
  // Future loadMore({required MealTimeType type}) async {
  //   increaseLimit(type: type);
  //   await fetchMeal(type: type, mealLimit: getLimit(type: type));
  // }

  @action
  Future skipLoadMoreData() async {
    isPaginationLoading = true;
    try {
      final jwt = appState.jwt;
      if (jwt != null) {
        Map<String, dynamic> queryParams = {
          '\$limit': '10',
          '\$skip': isFilterApplied
              ? currentTotal.toString()
              : currentViewList.length.toString(),
          'couponType': currentView.intoString(),
          '\$populate': 'createdBy',
        };
        final url = ApiHelper.getUri(
            queryParams: queryParams,
            urlEndpoint: ApiEndpoints.listApiEndpoint);
        final header = ApiHelper.getApiHeader(jwt: jwt);
        final response = await http.get(url, headers: header).timeout(
              const Duration(
                seconds: 7,
              ),
            );
        if (response.statusCode == 200) {
          isCouponLoaded = true;
          List<dynamic> list = jsonDecode(response.body)['data'];
          List<CouponDataModel> mealList = [];
          for (final doc in list) {
            final model = CouponDataModel.fromJson(doc);
            mealList.add(model);
          }
          // mealList.sort((a, b) {
          //   return a.price.compareTo(b.price);
          // });
          isPaginationLoading = false;
          switch (currentView) {
            case MealTimeType.breakfast:
              breakfastList.addAll(mealList);
            case MealTimeType.lunch:
              lunchList.addAll(mealList);
            case MealTimeType.dinner:
              dinnerList.addAll(mealList);
          }
        } else {
          // isCouponLoaded = false;
          // appState.authError = const AuthErrorUnknownIssue();
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isPaginationLoading = false;
    }
  }

  @action
  Future fetchMeal({required MealTimeType type, required int mealLimit}) async {
    isLoading = true;
    try {
      final jwt = appState.jwt;
      if (jwt != null) {
        Map<String, dynamic> queryParams = {
          '\$limit': mealLimit.toString(),
          'couponType': type.intoString(),
          '\$populate': 'createdBy',
        };
        final url = ApiHelper.getUri(
            queryParams: queryParams,
            urlEndpoint: ApiEndpoints.listApiEndpoint);
        final header = ApiHelper.getApiHeader(jwt: jwt);
        final response = await http
            .get(url, headers: header)
            .timeout(const Duration(seconds: 7));
        if (response.statusCode == 200) {
          isCouponLoaded = true;
          List<dynamic> list = jsonDecode(response.body)['data'];
          clearMeal(mealType: type);
          List<CouponDataModel> mealList = [];
          for (final doc in list) {
            final model = CouponDataModel.fromJson(doc);
            mealList.add(model);
          }
          mealList.sort((a, b) {
            return a.price.compareTo(b.price);
          });
          final total = jsonDecode(response.body)['total'] as int;
          addMeal(list: mealList, type: type, total: total);
        } else {
          isCouponLoaded = false;
          appState.authError = const AuthErrorUnknownIssue();
        }
      }
    } on SocketException {
      isCouponLoaded = false;
      appState.authError = const AuthErrorNetworkIssue();
    } on http.ClientException {
      isCouponLoaded = false;

      appState.authError = const AuthErrorNetworkIssue();
    } catch (e) {
      isCouponLoaded = false;

      appState.authError = const AuthErrorUnknownIssue();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future fetchMealAllUse(
      {required MealTimeType type, required int mealLimit}) async {
    isLoading = true;
    try {
      final jwt = appState.jwt;
      if (jwt != null) {
        Map<String, dynamic> queryParams = {
          '\$limit': mealLimit.toString(),
          'couponType': type.intoString(),
          '\$populate': 'createdBy',
        };
        final url = ApiHelper.getUri(
            queryParams: queryParams,
            urlEndpoint: ApiEndpoints.listApiEndpoint);
        final header = ApiHelper.getApiHeader(jwt: jwt);
        final response = await http.get(url, headers: header).timeout(
              const Duration(
                seconds: 7,
              ),
            );
        if (response.statusCode == 200) {
          isCouponLoaded = true;
          List<dynamic> list = jsonDecode(response.body)['data'];
          clearMeal(mealType: type);
          List<CouponDataModel> mealList = [];
          for (final doc in list) {
            final model = CouponDataModel.fromJson(doc);
            mealList.add(model);
          }
          final total = jsonDecode(response.body)['total'] as int;
          mealList.sort((a, b) {
            return a.price.compareTo(b.price);
          });
          addMeal(list: mealList, type: type, total: total);
        } else {
          isCouponLoaded = false;
          appState.authError = const AuthErrorUnknownIssue();
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  void clearMeal({required MealTimeType mealType}) {
    switch (mealType) {
      case MealTimeType.breakfast:
        breakfastList.clear();
        break;
      case MealTimeType.lunch:
        lunchList.clear();
        break;
      case MealTimeType.dinner:
        dinnerList.clear();
        break;
    }
  }

  @action
  void addMeal({
    required List<CouponDataModel> list,
    required MealTimeType type,
    required int total,
  }) {
    switch (type) {
      case MealTimeType.breakfast:
        breakfastList = ObservableList.of(list);
        totalBreakfastAvailable = total;
        break;
      case MealTimeType.lunch:
        lunchList = ObservableList.of(list);
        totalLunchAvailable = total;
        break;
      case MealTimeType.dinner:
        dinnerList = ObservableList.of(list);
        totalDinnerAvailable = total;
        break;
    }
  }

  @action
  Future sellCoupon(CouponModel model) async {
    isLoading = true;
    try {
      final jwt = appState.jwt;
      if (jwt != null) {
        Uri uri = ApiHelper.getUri(urlEndpoint: ApiEndpoints.listApiEndpoint);
        final header = ApiHelper.getApiHeader(jwt: jwt);
        final Map<String, dynamic> body = {
          "couponType": model.mealTime.intoString(),
          // "couponDate": formatCurrentDate(),
          "price": model.cost,
          "couponFloor": model.floor.intoInt(),
          "isVeg": model.mealType.intoBool(),
          "couponDate": date.toIso8601String(),
        };
        final res = await http
            .post(
              uri,
              body: jsonEncode(body),
              headers: header,
            )
            .timeout(const Duration(seconds: 6));
        if (res.statusCode == 201) {
          isCouponLoaded = true;
          await Future.wait([
            fetchMeal(
                type: model.mealTime,
                mealLimit: getLimit(type: model.mealTime)),
            userProfileStore.fetchSellingCouponList()
          ]);
        } else {
          isCouponLoaded = false;
          appState.authError = const AuthErrorUnknownIssue();
        }
      }
    } on SocketException {
      appState.authError = const AuthErrorNetworkIssue();
    } on ClientException {
      appState.authError = const AuthErrorNetworkIssue();
    } on TimeoutException {
      appState.authError = const AuthErrorUnknownIssue();
    } catch (e) {
      appState.authError = const AuthErrorUnknownIssue();
    } finally {
      isLoading = false;
      appState.canDialogPop = true;
    }
  }

  @action
  void deleteCouponLocally({required CouponDataModel coupon}) {
    switch (mealTimeTypeMap[coupon.couponType]) {
      case MealTimeType.breakfast:
        breakfastList.removeWhere((c) => c.id == coupon.id);
        totalBreakfastAvailable -= 1;
        break;
      case MealTimeType.lunch:
        lunchList.removeWhere((c) => c.id == coupon.id);
        totalLunchAvailable -= 1;
        break;
      case MealTimeType.dinner:
        dinnerList.removeWhere((c) => c.id == coupon.id);
        totalDinnerAvailable -= 1;
        break;
      case null:
    }
  }

  @action
  void updateCouponLocally({
    required CouponDataModel coupon,
  }) {
    switch (mealTimeTypeMap[coupon.couponType]) {
      case MealTimeType.breakfast:
        final i = breakfastList.indexWhere((c) => c.id == coupon.id);
        if (i == -1) {
          break;
        }
        breakfastList[i] = coupon;
        break;
      case MealTimeType.lunch:
        final i = lunchList.indexWhere((c) => c.id == coupon.id);
        if (i == -1) {
          break;
        }
        lunchList[i] = coupon;
        break;
      case MealTimeType.dinner:
        final i = dinnerList.indexWhere((c) => c.id == coupon.id);
        if (i == -1) {
          break;
        }
        dinnerList[i] = coupon;
        break;
      case null:
    }
  }

  int getLimit({required MealTimeType type}) {
    switch (type) {
      case MealTimeType.breakfast:
        return breakfastCount;
      case MealTimeType.lunch:
        return lunchCount;
      case MealTimeType.dinner:
        return dinnerCount;
    }
  }

  @action
  Future fetchAllMeals() async {
    try {
      await Future.wait([
        fetchMealAllUse(
            type: MealTimeType.breakfast, mealLimit: breakfastLimit),
        fetchMealAllUse(type: MealTimeType.lunch, mealLimit: lunchLimit),
        fetchMealAllUse(type: MealTimeType.dinner, mealLimit: dinnerLimit),
      ]);
    } on SocketException {
      isCouponLoaded = false;
      appState.authError = const AuthErrorNetworkIssue();
    } on http.ClientException {
      isCouponLoaded = false;

      appState.authError = const AuthErrorNetworkIssue();
    } catch (e) {
      isCouponLoaded = false;
      appState.authError = const AuthErrorUnknownIssue();
    } finally {
      isLoading = false;
    }
  }
}
