import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
// import 'package:mess_mgmt/Global/models/coupon_model.dart';
// import 'package:mess_mgmt/Global/widgets/custom_list_tile.dart';
import 'package:mess_mgmt/Global/widgets/my_list_tile.dart';
import 'package:mess_mgmt/Global/widgets/my_shimmer_list_tile.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({
    super.key,
    required this.mealTimeType,
  });
  final MealTimeType mealTimeType;

  @override
  Widget build(BuildContext context) {
    List<CouponDataModel> list = [];
    switch (mealTimeType) {
      case MealTimeType.breakfast:
        list = dashboardStore.breakfastList;
        break;
      case MealTimeType.lunch:
        list = dashboardStore.lunchList;
        break;
      case MealTimeType.dinner:
        list = dashboardStore.dinnerList;
        break;
    }
    ;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealTimeType.intoString()),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent.withOpacity(0.2),
              Colors.white.withOpacity(1),
            ],
          ),
        ),
        child: list.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: LottieBuilder.asset(
                        'assets/lottie/oops_anim.json',
                      ),
                    ),
                    const Text(
                      "Oops, please conect to the internet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                )),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return list.isNotEmpty
                      ? MyListTile(coupon: list[index])
                      : ShimmerListTile();
                },
              ),
      ),
    );
  }
}
