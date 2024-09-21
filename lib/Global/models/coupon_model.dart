import 'package:json_annotation/json_annotation.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';

part 'coupon_model.g.dart';

@JsonSerializable()
class CouponModel {
  final Floor floor;
  final MealType mealType;
  final MealTimeType mealTime;
  final int cost;

  const CouponModel({
    required this.floor,
    required this.mealTime,
    required this.mealType,
    required this.cost,
  });
  factory CouponModel.from(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
  Map<String, dynamic> toJson(json) => _$CouponModelToJson(this);
}
