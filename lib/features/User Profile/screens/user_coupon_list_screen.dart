import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/effects/shimmer_effect.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/features/User%20Profile/store/user_profile_store.dart';
import 'package:mess_mgmt/features/User%20Profile/widgets/confirm_delete_dialog.dart';

class CouponListScreen extends StatelessWidget {
  const CouponListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    userProfileStore.getSellingCouponList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Meal Coupons'),
        
      ),
      body: Observer(builder: (context) {
        final coupons = userProfileStore.userSellingCouponsList;
        final isLoading = userProfileStore.isLoading;
        if (isLoading) {
          return Column(children: [
            ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
            ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
            ShimmerEffect(child: UserSellingCouponShimmerChildWidget()),
          ]);
        }
        return ListView.builder(
          itemCount: coupons.length,
          itemBuilder: (context, index) {
            final coupon = coupons[index];
            return UserSellingCouponWidget(coupon: coupon);
          },
        );
      }),
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
              'Date: ${coupon.couponDate?.substring(0, 10)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$${coupon.price?.toStringAsFixed(2)}',
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
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          '${coupon.couponType} - ${coupon.couponDate?.substring(0, 10)}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${coupon.price?.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Floor: ${coupon.couponFloor}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                if (coupon.isVeg) const Icon(Icons.eco, color: Colors.green),
                const Spacer(),
                Text(
                  'Status: ${coupon.status}',
                  style: TextStyle(
                    color:
                        coupon.status == 'Active' ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Handle edit action
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showConfirmDeleteDialog(context,coupon: coupon);
              },
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CouponDetailScreen(coupon: coupon),
            ),
          );
        },
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
