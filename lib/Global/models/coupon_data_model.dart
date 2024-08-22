// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:mess_mgmt/Global/models/user_model.dart';

part 'coupon_data_model.g.dart';

@JsonSerializable()
class CouponDataModel {
  final String id;
  final String? couponType; // "lunch"
  final String? couponDate; // "2024-07-06T00:00:00.000Z",
  final int price; // 50,
  final int? couponFloor; // 1,
  final bool isVeg; // true,
  final String? status; // "active",
  final bool? deleted; // false,
  final String? createdAt; //"2024-07-06T15:21:51.074Z",
  final User? createdBy;
  CouponDataModel({
    required this.id,
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

  CouponDataModel copyWith({
    String? id,
    String? couponType,
    String? couponDate,
    int? price,
    int? couponFloor,
    bool? isVeg,
    String? status,
    bool? deleted,
    String? createdAt,
    User? createdBy,
  }) {
    return CouponDataModel(
      id: id ?? this.id,
      couponType: couponType ?? this.couponType,
      couponDate: couponDate ?? this.couponDate,
      price: price ?? this.price,
      couponFloor: couponFloor ?? this.couponFloor,
      isVeg: isVeg ?? this.isVeg,
      status: status ?? this.status,
      deleted: deleted ?? this.deleted,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
