// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponDataModel _$CouponDataModelFromJson(Map<String, dynamic> json) =>
    CouponDataModel(
      id: json['_id'] as String,
      couponType: json['couponType'] as String?,
      couponDate: json['couponDate'] as String?,
      price: (json['price'] as num).toInt(),
      couponFloor: (json['couponFloor'] as num?)?.toInt(),
      isVeg: json['isVeg'] as bool,
      status: json['status'] as String?,
      deleted: json['deleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CouponDataModelToJson(CouponDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'couponType': instance.couponType,
      'couponDate': instance.couponDate,
      'price': instance.price,
      'couponFloor': instance.couponFloor,
      'isVeg': instance.isVeg,
      'status': instance.status,
      'deleted': instance.deleted,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
    };
