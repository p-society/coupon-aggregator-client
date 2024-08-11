// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel(
      floor: $enumDecode(_$FloorEnumMap, json['floor']),
      mealTime: $enumDecode(_$MealTimeTypeEnumMap, json['mealTime']),
      mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
      cost: (json['cost'] as num).toInt(),
    );

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'floor': _$FloorEnumMap[instance.floor]!,
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'mealTime': _$MealTimeTypeEnumMap[instance.mealTime]!,
      'cost': instance.cost,
    };

const _$FloorEnumMap = {
  Floor.first: 'first',
  Floor.ground: 'ground',
};

const _$MealTimeTypeEnumMap = {
  MealTimeType.breakfast: 'breakfast',
  MealTimeType.lunch: 'lunch',
  MealTimeType.dinner: 'dinner',
};

const _$MealTypeEnumMap = {
  MealType.veg: 'veg',
  MealType.nonVeg: 'nonVeg',
};
