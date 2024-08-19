import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/features/User%20Profile/store/user_profile_store.dart';
import 'package:mobx/mobx.dart';

import '../../../Global/widgets/loader.dart';

showConfirmDeleteDialog(
  BuildContext context, {
  required CouponDataModel coupon,
}) {
  userProfileStore.canDialogPop = false;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure to delete'),
        content: Observer(builder: (context) {
          final isLoadingLocally = userProfileStore.isLoadingLocally;
          if (isLoadingLocally) {
            return const AppLoader();
          }
          return const SizedBox();
        }),
        actions: [
          Observer(builder: (context) {
            final isLoadingLocally = userProfileStore.isLoadingLocally;
            if (isLoadingLocally) {
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
                ReactionBuilder(
                  builder: (context) {
                    return autorun((_) {
                      final canDialogPop = userProfileStore.canDialogPop;
                      if (canDialogPop) {
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      userProfileStore.deleteCoupon(coupon: coupon);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                    ),
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
