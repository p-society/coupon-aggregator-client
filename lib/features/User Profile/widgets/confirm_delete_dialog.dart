import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/features/User%20Profile/store/user_profile_store.dart';

import '../../../Global/widgets/loader.dart';

showConfirmDeleteDialog(
  BuildContext context, {
  required CouponDataModel coupon,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure to delete'),
        content: Observer(builder: (context) {
          final isLoading = userProfileStore.isLoading;
          if (isLoading) {
            return const AppLoader();
          }
          return const SizedBox();
        }),
        actions: [
          Observer(builder: (context) {
            final isLoading = userProfileStore.isLoading;
            if (isLoading) {
              return const SizedBox();
            }
            return Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    userProfileStore.deleteCoupon(coupon: coupon);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text(
                    'Confirm',
                  ),
                ),
              ],
            );
          }),
        ],
      );
    },
  );
}
