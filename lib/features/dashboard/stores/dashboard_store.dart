import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_model.dart';
import 'package:mobx/mobx.dart';
part 'dashboard_store.g.dart';

final DashboardStore dashboardStore = DashboardStore();

class DashboardStore = Dashboard with _$DashboardStore;

abstract class Dashboard with Store {
  //Observables instances :

  @observable
  bool isLoading = false;
  @observable
  ObservableList<CouponModel> breakfastList = ObservableList<CouponModel>();
  @observable
  ObservableList<CouponModel> lunchList = ObservableList<CouponModel>();
  @observable
  ObservableList<CouponModel> dinnerList = ObservableList<CouponModel>();

  // Computed getter methods :

  @computed
  int get breakfastCount => breakfastList.length;
  @computed
  int get lunchCount => lunchList.length;
  @computed
  int get dinnerCount => dinnerList.length;

  // Actions methods :

  void sellCoupon(CouponModel coupon) {
    switch (coupon.mealTime) {
      case MealTimeType.breakfast:
        breakfastList.add(coupon);
      case MealTimeType.lunch:
        lunchList.add(coupon);
      case MealTimeType.dinner:
        dinnerList.add(coupon);
    }
  }
}
