import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/models/user_model.dart';
class MyCouponTile extends StatelessWidget {
  final CouponDataModel coupon;
  final int i;
  final User user;

  const MyCouponTile({
    super.key,
    required this.coupon,
    required this.i, 
    required this.user,  
  });

  void markSold(int index, BuildContext context) {
    Navigator.of(context).pop(index);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: const Text("Coupon sold"),
                  )));
        });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            title: Text(
              coupon.createdBy?.fName ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              "Floor: ${coupon.couponFloor}",
              style: const TextStyle(
                color: Colors.white70,
              ),
              
            ),
            trailing: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Column(
                    children: [
                      Text(
                        "Rs. ${coupon.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        coupon.isVeg ? 'Veg' : 'Non-Veg',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () => markSold(i, context),
                    icon: const Icon(Icons.check),
                    label: const Text(
                      "Sold",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        iconColor: Colors.blueAccent),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
