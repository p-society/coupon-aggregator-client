import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/enums/pagination_enum.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/widgets/custom_filter_dialog.dart';
import 'package:mess_mgmt/Global/widgets/custom_list_tile.dart';
import 'package:mess_mgmt/features/Networking/widgets/wobbleAppbar.dart';
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
    AppBar customAppBar(
        BuildContext context, String mealTimeType, Function showFilterDialog) {
      return AppBar(
        title: Text(
          mealTimeType,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              showFilterDialog(context: context);
            },
            label: const Text(
              'Apply Filter',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      /* appBar: AppBar(
        title: Text(mealTimeType.intoString()),
        backgroundColor: Colors.transparent,
        actions: [
          TextButton.icon(
            onPressed: () {
              showFilterDialog(context: context);
            },
            label: const Text('Apply Filter'),
            icon: const Icon(
              Icons.filter_list,
            ),
          ),
        ],
      ), */
      appBar: customAppBar(context, mealTimeType.intoString(), showFilterDialog),
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
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            /* ListTile(
              title: const Text("SellerName : "),
              subtitle: Text('Cost : ${list[index].cost}'),
              trailing: Text(list[index].mealType.intoString()),
            ); */
            return GlassyListTile(
              coupon: list[index],
              i: index,
            );
          },
        ),
      ),
    );
  }
}
