import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mgmt/Global/Functions/format_date.dart';
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
  Future fetchListCoupon() async {
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

        final res = await http.get(uri, headers: header);
        if (res.statusCode == 200) {
          List<dynamic> list = jsonDecode(res.body)['data'];
          print('fetched List of Coupon');
          print(res.body);
          breakfastList.clear();
          lunchList.clear();
          dinnerList.clear();
          for (final doc in list) {
            if (doc['couponType'] == 'lunch') {
              lunchList.add(CouponDataModel.fromJson(doc));
            } else if (doc['couponType'] == 'dinner') {
              dinnerList.add(CouponDataModel.fromJson(doc));
            } else {
              breakfastList.add(CouponDataModel.fromJson(doc));
            }
          }
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future fetchBreakfast(int limit) async {
    isLoading = true;
    try {
      final jwt = appState.jwt;
      if (jwt != null) {
        String _baseUrl = dotenv.env['Base_URL'] as String;
        Map<String, String> header = {
          "content-type": "application/json",
          "Authorization": "Bearer $jwt",
        };
        Map<String, dynamic> queryParams = {
          "limit": limit.toString(),
        };

        final Uri url = Uri.parse('$_baseUrl/list-coupon?%26limit=20');
        // .replace(queryParameters: queryParams);
        print(url);
        final response = await http.get(url, headers: header);
        print(response.body);
        //   Uri uri = Uri.parse(url);

        //   final res = await http.get(uri, headers: header);
        //   if (res.statusCode == 200) {
        //     List<dynamic> list = jsonDecode(res.body)['data'];
        //     print('fetched List of Coupon');
        //     print(res.body);
        //     breakfastList.clear();

        //     for (final doc in list) {
        //       breakfastList.add(CouponDataModel.fromJson(doc));
        //     }
        //   }
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading = false;
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

        print(res.statusCode);
        print(res.body);

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
      await fetchBreakfast(10);
      isLoading = false;
    }
  }
}
