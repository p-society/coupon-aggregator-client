import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_endpoints.dart';
import 'package:mess_mgmt/Global/Helper/API%20Helper/api_helper.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';

class UserProfileRepo {
  static Future<http.Response> getUserCouponList() async {
    final header = ApiHelper.getApiHeader(jwt: appState.jwt);
    print("User id is : : ${appState.currentUser?.id}");
    final uri = ApiHelper.getUri(
        urlEndpoint: ApiEndpoints.listApiEndpoint,
        queryParams: {
          "\$populate": "createdBy",
          "createdBy": appState.currentUser!.id,
        });
    final response = await http.get(uri, headers: header);
    print(response.statusCode);
    print(response.body);
    return response;
  }

  static Future<http.Response> deleteCoupon({required String couponId}) async {
    final header = ApiHelper.getApiHeader(jwt: appState.jwt);
    final uri = ApiHelper.getUri(
      urlEndpoint: "${ApiEndpoints.listApiEndpoint}/$couponId",
    );
    final response = await http.delete(uri, headers: header);
    print(response.statusCode);
    print(response.body);
    return response;
  }

  static Future<http.Response> updateCoupon(
      {required CouponDataModel coupon}) async {
    final header = ApiHelper.getApiHeader(jwt: appState.jwt);
    final uri = ApiHelper.getUri(
      urlEndpoint: "${ApiEndpoints.listApiEndpoint}/${coupon.id}",
    );
    final body = coupon.toJson();
    final response = await http.patch(uri, headers: header,body: body);
    print(response.statusCode);
    print(response.body);
    return response;
  }
}
