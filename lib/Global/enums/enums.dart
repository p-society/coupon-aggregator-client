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
}
