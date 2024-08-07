import 'package:mess_mgmt/Global/enums/enums.dart';

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
}
