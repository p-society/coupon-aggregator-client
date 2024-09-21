import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mess_mgmt/Global/Error%20Screen/network_error_screen.dart';
import 'package:mess_mgmt/Global/Functions/format_date.dart';
import 'package:mess_mgmt/Global/dialogs/edit_coupon_dialog.dart';
import 'package:mess_mgmt/Global/effects/shimmer_effect.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/enums/pagination_enum.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/features/User%20Profile/store/user_profile_store.dart';
import 'package:mess_mgmt/features/User%20Profile/widgets/confirm_delete_dialog.dart';

import '../../../Global/theme/app_theme.dart';
import '../../../Global/widgets/loader.dart';

class CouponListScreen extends StatelessWidget {
  const CouponListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (userProfileStore.userSellingCouponsList.isEmpty) {
      userProfileStore.fetchSellingCouponList();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Meal Coupons'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppTheme.linearGradient(),
        ),
        child: Observer(
          builder: (context) {
            final coupons = userProfileStore.userSellingCouponsList;
            final isLoading = userProfileStore.isLoading;
            final isCouponLoaded = userProfileStore.isCouponLoaded;
            if (isLoading) {
              return const SingleChildScrollView(
                child: Column(
                  children: [
                    ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
                    ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
                    ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
                    ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
                    ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
                    ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
                  ],
                ),
              );
            }
            if (!isLoading && !isCouponLoaded) {
              return OfflineRetryPage(
                  onRetry: userProfileStore.fetchSellingCouponList);
            }
            if (coupons.isEmpty) {
              return Center(
                child: Text(
                  'You haven\'t sell any Coupon yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
            return ListView.builder(
              itemCount: coupons.length,
              itemBuilder: (context, index) {
                final coupon = coupons[index];

                if (index == coupons.length - 1) {
                  return Observer(builder: (context) {
                    final isPaginationLoading =
                        userProfileStore.isPaginationLoading;
                    final pagination = userProfileStore.currentPagination;
                    return Column(
                      children: [
                        UserSellingCouponWidget(coupon: coupon),
                        if (!isPaginationLoading)
                          pagination.getPaginationwidget(onPressed: () {
                            userProfileStore.skipLoadMore();
                          }),
                        if (isPaginationLoading) const AppLoader()
                      ],
                    );
                  });
                }
                return UserSellingCouponWidget(coupon: coupon);
              },
            );
          },
        ),
      ),
    );
  }
}

class CouponDetailScreen extends StatelessWidget {
  final CouponDataModel coupon;

  const CouponDetailScreen({
    required this.coupon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${coupon.couponType} Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Type: ${coupon.couponType}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Date: ${coupon.couponDate}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$${coupon.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Floor: ${coupon.couponFloor}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Vegetarian: ${coupon.isVeg ? "Yes" : "No"}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${coupon.status}',
              style: TextStyle(
                fontSize: 18,
                color: coupon.status == 'Active' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserSellingCouponWidget extends StatelessWidget {
  const UserSellingCouponWidget({
    super.key,
    required this.coupon,
  });

  final CouponDataModel coupon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${mealTimeTypeMap[coupon.couponType]?.intoTitle()}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                Text(
                  coupon.couponDate!.getDate(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Status: ',
                ),
                Text(
                  '${coupon.status?.toUpperCase()}',
                  style: TextStyle(
                    color:
                        coupon.status == 'active' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Available at : ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '₹ ${coupon.price}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/svg_image/isVeg.svg",
                  width: 60,
                  height: 60,
                  colorFilter: ColorFilter.mode(
                    coupon.isVeg
                        ? const Color.fromARGB(255, 33, 134, 37)
                        : const Color.fromARGB(255, 179, 40, 30),
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Floor: ${coupon.couponFloor}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (coupon.status != "expire")
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showEditCouponDialog(
                        context: context,
                        coupon: coupon,
                      );
                    },
                  ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showConfirmDeleteDialog(
                      context,
                      coupon: coupon,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserSellingCouponShimmerChildWidget extends StatelessWidget {
  const UserSellingCouponShimmerChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
