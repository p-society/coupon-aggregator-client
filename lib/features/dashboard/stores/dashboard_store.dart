import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mess_mgmt/Global/Functions/format_date.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_endpoints.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_helper.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/models/coupon_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/features/auth/error%20handling/auth_error.dart';
import 'package:mobx/mobx.dart';

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

  @observable
  bool isLoadMore = false;

  @observable
  MealTimeType currentView = MealTimeType.breakfast;

  @computed
  int get breakfastCount => breakfastList.length;
  @computed
  int get lunchCount => lunchList.length;
  @computed
  int get dinnerCount => dinnerList.length;
  
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

  @action
  Future loadMore({required MealTimeType type}) async {
    increaseLimit(type: type);
    await fetchMeal(type: type, mealLimit: getLimit(type: type));
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
        final response = await http.get(url, headers: header);
        if (response.statusCode == 200) {
          List<dynamic> list = jsonDecode(response.body)['data'];
          clearMeal(mealType: type);
          List<CouponDataModel> mealList = [];
          for (final doc in list) {
            mealList.add(CouponDataModel.fromJson(doc));
          }
          final total = jsonDecode(response.body)['total'] as int;
          addMeal(list: mealList, type: type, total: total);
        }
      }
    } on SocketException {
      appState.authError = const AuthErrorNetworkIssue();
    } on http.ClientException {
      appState.authError = const AuthErrorNetworkIssue();
    } catch (e) {
      appState.authError = const AuthErrorUnknownIssue();
    } finally {
      isLoading = false;
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
  void addMeal(
      {required List<CouponDataModel> list,
      required MealTimeType type,
      required int total}) {
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
          "couponDate": formatCurrentDate(),
          "price": model.cost,
          "couponFloor": model.floor.intoInt(),
          "isVeg": model.mealType.intoBool(),
        };
        final res = await http.post(
          uri,
          body: jsonEncode(body),
          headers: header,
        );

        if (res.statusCode == 201) {
          final mealLimit = getLimit(type: model.mealTime);
          await fetchMeal(type: model.mealTime, mealLimit: mealLimit);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading = false;
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
        return breakfastLimit;
      case MealTimeType.lunch:
        return lunchLimit;
      case MealTimeType.dinner:
        return dinnerLimit;
    }
  }

  @action
  Future fetchAllMeals() async {
    try {
      await fetchMeal(type: MealTimeType.breakfast, mealLimit: breakfastLimit);
      await fetchMeal(type: MealTimeType.lunch, mealLimit: lunchLimit);
      await fetchMeal(type: MealTimeType.dinner, mealLimit: dinnerLimit);
    } catch (e) {
      throw Exception(e);
    }
  }
}
