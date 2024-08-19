import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/enums/pagination_enum.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/models/user_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/Global/widgets/custom_filter_dialog.dart';
import 'package:mess_mgmt/Global/widgets/custom_list_tile.dart';
import 'package:mess_mgmt/features/auth/stores/auth_store.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';
import 'package:mess_mgmt/Global/widgets/mycoupons_view.dart';

class MyCouponScreen extends StatelessWidget {
  const MyCouponScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = appState.currentUser;
    List<CouponDataModel> list = [
      CouponDataModel(
          couponType: 'Lunch',
          couponDate: '12-2-2123',
          price: 30,
          couponFloor: 1,
          isVeg: true,
          status: 'Not Sell',
          deleted: false,
          createdAt: 'createdAt',
          createdBy: user)
    ];
    /* case MealTimeType.breakfast:
        list = dashboardStore.breakfastList;
        break;
      case MealTimeType.lunch:
        list = dashboardStore.lunchList;
        break;
      case MealTimeType.dinner:
        list = dashboardStore.dinnerList;
        break; */

    return Scaffold(
      appBar: AppBar(
        title: Text("${user!.fName} ${user!.lName}"),
        /* actions: [
          TextButton.icon(
            onPressed: () {
              showFilterDialog(context: context);
            },
            label: const Text('Apply Filter'),
            icon: const Icon(Icons.filter_list),
          ),
        ], */
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
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            /* ListTile(
              title: const Text("SellerName : "),
              subtitle: Text('Cost : ${list[index].cost}'),
              trailing: Text(list[index].mealType.intoString()),
            ); */
            if (user == null) {
              return SizedBox();
            } else {
              return MyCouponTile(
                coupon: list[index],
                i: index,
                user: user,
              );
            }
          },
        ),
      ),
    );
  }
}
