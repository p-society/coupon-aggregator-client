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

extension FloorString on Floor {
  String intoString() {
    switch (this) {
      case Floor.first:
        return 'First';
      case Floor.ground:
        return 'Ground';
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
}

extension MealTimeTypeString on MealTimeType {
  String intoString() {
    switch (this) {
      case MealTimeType.breakfast:
        return 'Breakfast';
      case MealTimeType.lunch:
        return 'Lunch';
      case MealTimeType.dinner:
        return 'Dinner';
    }
  }
}
