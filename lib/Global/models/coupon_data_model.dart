import 'package:json_annotation/json_annotation.dart';
import 'package:mess_mgmt/Global/models/user_model.dart';

part 'coupon_data_model.g.dart';

@JsonSerializable()
class CouponDataModel {
  // final String _id;
  final String? couponType; // "lunch"
  final String? couponDate; // "2024-07-06T00:00:00.000Z",
  final int? price; // 50,
  final int? couponFloor; // 1,
  final bool isVeg; // true,
  final String? status; // "active",
  final bool? deleted; // false,
  final String? createdAt; //"2024-07-06T15:21:51.074Z",
  final User? createdBy;
  CouponDataModel({
    // required this._id,
    required this.couponType,
    required this.couponDate,
    required this.price,
    required this.couponFloor,
    required this.isVeg,
    required this.status,
    required this.deleted,
    required this.createdAt,
    required this.createdBy,
  });
  // "createdBy": "66895ed7f753fc4efe327814",
  // "updatedAt": "2024-07-06T15:21:51.074Z",
  // "__v": 0

  factory CouponDataModel.fromJson(Map<String, dynamic> json) =>
      _$CouponDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$CouponDataModelToJson(this);
}
