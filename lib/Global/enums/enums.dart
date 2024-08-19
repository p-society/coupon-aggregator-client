import 'package:flutter/material.dart';

enum MealTimeType {
  breakfast,
  lunch,
  dinner,
}

enum MealType {
  veg,
  nonVeg,
}

enum Floor {
  first,
  ground,
}

enum CouponStatus {
  active,
  sold,
  expired,
}

const Map<String, MealTimeType> mealTimeTypeMap = {
  'breakfast': MealTimeType.breakfast,
  'lunch': MealTimeType.lunch,
  'dinner': MealTimeType.dinner,
};

const Map<String, CouponStatus> couponStatusMap = {
  'active': CouponStatus.active,
  'sold': CouponStatus.sold,
};
const Map<int, Floor> floorMap = {
  1: Floor.ground,
  2: Floor.first,
};

extension CouponStatusExtension on CouponStatus {
  String intoString() {
    switch (this) {
      case CouponStatus.active:
        return "active";
      case CouponStatus.expired:
        return "expired";
      case CouponStatus.sold:
        return "sold";
    }
  }
}

extension FloorString on Floor {
  String intoString() {
    switch (this) {
      case Floor.first:
        return 'First';
      case Floor.ground:
        return 'Ground';
    }
  }

  int intoInt() {
    switch (this) {
      case Floor.first:
        return 2;
      case Floor.ground:
        return 1;
    }
  }
}

extension MealTypeString on MealType {
  String intoString() {
    switch (this) {
      case MealType.veg:
        return 'Veg';
      case MealType.nonVeg:
        return 'Non-Veg';
    }
  }

  bool intoBool() {
    switch (this) {
      case MealType.veg:
        return true;
      case MealType.nonVeg:
        return false;
    }
  }
}

extension MealTimeTypeString on MealTimeType {
  String intoString() {
    switch (this) {
      case MealTimeType.breakfast:
        return 'breakfast';
      case MealTimeType.lunch:
        return 'lunch';
      case MealTimeType.dinner:
        return 'dinner';
    }
  }

  String intoTitle() {
    switch (this) {
      case MealTimeType.breakfast:
        return 'Breakfast';
      case MealTimeType.lunch:
        return 'Lunch';
      case MealTimeType.dinner:
        return 'Dinner';
    }
  }

  IconData getIcon() {
    switch (this) {
      case MealTimeType.breakfast:
        return Icons.free_breakfast;
      case MealTimeType.lunch:
        return Icons.restaurant;
      case MealTimeType.dinner:
        return Icons.nightlife;
    }
  }
}
