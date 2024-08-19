import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/widgets/custom_filter_dialog.dart';
import 'package:mess_mgmt/Global/widgets/custom_list_tile.dart';
import 'package:mess_mgmt/Global/widgets/my_list_tile.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<CouponDataModel> list = [];
    // switch (mealTimeType) {
    //   case MealTimeType.breakfast:
    //     list = dashboardStore.breakfastList;
    //     break;
    //   case MealTimeType.lunch:
    //     list = dashboardStore.lunchList;
    //     break;
    //   case MealTimeType.dinner:
    //     list = dashboardStore.dinnerList;
    //     break;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          return Text(dashboardStore.currentView.intoTitle());
        }),
        actions: [
          TextButton.icon(
            onPressed: () {
              showFilterDialog(context: context);
            },
            label: const Text('Apply Filter'),
            icon: const Icon(Icons.filter_list),
          ),
        ],
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
        child: Observer(builder: (context) {
          final list = dashboardStore.currentViewList;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              /* ListTile(
                  title: const Text("SellerName : "),
                  subtitle: Text('Cost : ${list[index].cost}'),
                  trailing: Text(list[index].mealType.intoString()),
                ); */
              return MyListTile(
                coupon: list[index],
              );
            },
          );
        }),
      ),
    );
  }
}
