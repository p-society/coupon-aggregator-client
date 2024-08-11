import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mgmt/Global/Functions/format_date.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_endpoints.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_helper.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/models/coupon_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mobx/mobx.dart';
part 'dashboard_store.g.dart';

final DashboardStore dashboardStore = DashboardStore();

class DashboardStore = Dashboard with _$DashboardStore;

abstract class Dashboard with Store {
  //Observables instances :

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
  int breakfastLimit = 10;

  @observable
  int lunchLimit = 10;

  @observable
  int dinnerLimit = 10;

  // Computed getter methods :

  @computed
  int get breakfastCount => breakfastList.length;
  @computed
  int get lunchCount => lunchList.length;
  @computed
  int get dinnerCount => dinnerList.length;

  // Actions methods :

  // void sellCoupon(CouponDataModel coupon) {
  //   switch (coupon.couponType) {
  //     // case MealTimeType.breakfast:
  //     //   breakfastList.add(coupon);
  //     // case MealTimeType.lunch:
  //     //   lunchList.add(coupon);
  //     // case MealTimeType.dinner:
  //     //   dinnerList.add(coupon);
  //     case "breakfast":
  //       breakfastList.add(coupon);
  //     case "lunch":
  //       lunchList.add(coupon);
  //     case "dinner":
  //       dinnerList.add(coupon);
  //   }
  // }

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
  // Future fetchListCoupon() async {
  //   isLoading = true;
  //   try {
  //     final jwt = appState.jwt;
  //     if (jwt != null) {
  //       String url = dotenv.env['Fetch_Coupon_Url'] as String;
  //       Map<String, String> header = {
  //         "content-type": "application/json",
  //         "Authorization": "Bearer $jwt",
  //       };

  //       Uri uri = Uri.parse(url);

  //       final res = await http.get(uri, headers: header);
  //       if (res.statusCode == 200) {
  //         List<dynamic> list = jsonDecode(res.body)['data'];
  //         print('fetched List of Coupon');
  //         print(res.body);
  //         breakfastList.clear();
  //         lunchList.clear();
  //         dinnerList.clear();
  //         for (final doc in list) {
  //           if (doc['couponType'] == 'lunch') {
  //             lunchList.add(CouponDataModel.fromJson(doc));
  //           } else if (doc['couponType'] == 'dinner') {
  //             dinnerList.add(CouponDataModel.fromJson(doc));
  //           } else {
  //             breakfastList.add(CouponDataModel.fromJson(doc));
  //           }
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   } finally {
  //     isLoading = false;
  //   }
  // }

  // @action
  // Future fetchBreakfast() async {
  //   isLoading = true;
  //   try {
  //     final jwt = appState.jwt;
  //     if (jwt != null) {
  //       // String baseUrl = dotenv.env['Base_URL'] as String;
  //       // Map<String, String> header = {
  //       //   "content-type": "application/json",
  //       //   "Authorization": "Bearer $jwt",
  //       // };
  //       Map<String, dynamic> queryParams = {
  //         '\$limit': breakfastLimit.toString(),
  //         'couponType': 'breakfast',
  //         '\$populate': 'createdBy',
  //       };
  //       // final Uri url = Uri.parse('$baseUrl/list-coupon')
  //       //     .replace(queryParameters: queryParams);
  //       final url = ApiHelper.getUri(
  //           queryParams: queryParams,
  //           urlEndpoint: ApiEndpoints.listApiEndpoint);
  //       final header = ApiHelper.getApiHeader(jwt: jwt);
  //       final response = await http.get(url, headers: header);
  //       if (response.statusCode == 200) {
  //         List<dynamic> list = jsonDecode(response.body)['data'];
  //         breakfastList.clear();
  //         for (final doc in list) {
  //           final jsonData = jsonEncode(doc);
  //           breakfastList.add(CouponDataModel.fromJson(doc));
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   } finally {
  //     isLoading = false;
  //   }
  // }
  // @action
  // Future fetchLunch() async {
  //   isLoading = true;
  //   try {
  //     final jwt = appState.jwt;
  //     if (jwt != null) {
  //       // String baseUrl = dotenv.env['Base_URL'] as String;
  //       // Map<String, String> header = {
  //       //   "content-type": "application/json",
  //       //   "Authorization": "Bearer $jwt",
  //       // };
  //       Map<String, dynamic> queryParams = {
  //         '\$limit': lunchLimit.toString(),
  //         'couponType': 'lunch',
  //         '\$populate': 'createdBy',
  //       };
  //       // final Uri url = Uri.parse('$baseUrl/list-coupon')
  //       //     .replace(queryParameters: queryParams);
  //       final url = ApiHelper.getUri(
  //           queryParams: queryParams, urlEndpoint: 'list-coupon');
  //       final header = ApiHelper.getApiHeader(jwt: jwt);
  //       final response = await http.get(url, headers: header);
  //       if (response.statusCode == 200) {
  //         List<dynamic> list = jsonDecode(response.body)['data'];
  //         lunchList.clear();
  //         for (final doc in list) {
  //           final jsonData = jsonEncode(doc);
  //           lunchList.add(CouponDataModel.fromJson(doc));
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   } finally {
  //     isLoading = false;
  //   }
  // }

  // @action
  // Future fetchDinner() async {
  //   isLoading = true;
  //   try {
  //     final jwt = appState.jwt;
  //     if (jwt != null) {
  //       // String baseUrl = dotenv.env['Base_URL'] as String;
  //       // Map<String, String> header = {
  //       //   "content-type": "application/json",
  //       //   "Authorization": "Bearer $jwt",
  //       // };
  //       Map<String, dynamic> queryParams = {
  //         '\$limit': dinnerLimit.toString(),
  //         'couponType': 'dinner',
  //         '\$populate': 'createdBy',
  //       };
  //       // final Uri url = Uri.parse('$baseUrl/list-coupon')
  //       //     .replace(queryParameters: queryParams);
  //       final url = ApiHelper.getUri(
  //           queryParams: queryParams, urlEndpoint: 'list-coupon');
  //       final header = ApiHelper.getApiHeader(jwt: jwt);
  //       final response = await http.get(url, headers: header);
  //       if (response.statusCode == 200) {
  //         List<dynamic> list = jsonDecode(response.body)['data'];
  //         dinnerList.clear();
  //         for (final doc in list) {
  //           final jsonData = jsonEncode(doc);
  //           dinnerList.add(CouponDataModel.fromJson(doc));
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   } finally {
  //     isLoading = false;
  //   }
  // }

  @action
  Future fetchMeal({required MealTimeType type,required int mealLimit}) async {
    isLoading = true;
    try {
      final jwt = appState.jwt;
      if (jwt != null) {
        // String baseUrl = dotenv.env['Base_URL'] as String;
        // Map<String, String> header = {
        //   "content-type": "application/json",
        //   "Authorization": "Bearer $jwt",
        // };
        Map<String, dynamic> queryParams = {
          '\$limit': mealLimit.toString(),
          'couponType': type.intoString(),
          '\$populate': 'createdBy',
        };
        // final Uri url = Uri.parse('$baseUrl/list-coupon')
        //     .replace(queryParameters: queryParams);
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
            // final jsonData = jsonEncode(doc);
            mealList.add(CouponDataModel.fromJson(doc));
          }
          addMeal(list: mealList, type: type);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
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
      {required List<CouponDataModel> list, required MealTimeType type}) {
    switch (type) {
      case MealTimeType.breakfast:
        breakfastList = ObservableList.of(list);
        break;
      case MealTimeType.lunch:
        lunchList = ObservableList.of(list);
        break;
      case MealTimeType.dinner:
        dinnerList = ObservableList.of(list);
        break;
    }
  }
  
  
  @action
  Future sellCoupon(CouponModel model) async {
    isLoading = true;
    try {
      final jwt = appState.jwt;
      if (jwt != null) {
        String url = dotenv.env['Fetch_Coupon_Url'] as String;
        Map<String, String> header = {
          "content-type": "application/json",
          "Authorization": "Bearer $jwt",
        };

        Uri uri = Uri.parse(url);
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
          // List<dynamic> list = jsonDecode(res.body)['data'];

          // for (final doc in list) {
          //   if (doc['couponType'] == 'lunch') {
          //     lunchList.add(CouponDataModel.fromJson(doc));
          //   } else if (doc['couponType'] == 'dinner') {
          //     dinnerList.add(CouponDataModel.fromJson(doc));
          //   } else {
          //     breakfastList.add(CouponDataModel.fromJson(doc));
          //   }
          // }
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      // await fetchListCoupon();
      final mealLimit = getLimit(type: model.mealTime);
      await fetchMeal(type: model.mealTime,mealLimit: mealLimit);
      isLoading = false;
    }
  }

  int getLimit({required MealTimeType type}){
    switch(type){
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
      await fetchMeal(type: MealTimeType.breakfast,mealLimit: breakfastLimit);
      await fetchMeal(type: MealTimeType.lunch,mealLimit: lunchLimit);
      await fetchMeal(type: MealTimeType.dinner,mealLimit: dinnerLimit);
    } catch (e) {
      throw Exception(e);
    }
  }
}
