import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_model.dart';

class GlassyListTile extends StatelessWidget {
  final CouponModel coupon;
  final int i;

  const GlassyListTile({
    super.key,
    required this.coupon,
    required this.i,
  });

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
            color: Colors.white.withOpacity(0.2), // Glass effect
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            title: Text(
              "rahul",
              style: TextStyle(
                color: Colors.white, // Title text color
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              "Floor: ${coupon.floor}",
              style: TextStyle(
                color: Colors.white70, // Subtitle text color
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rs ${coupon.cost}",
                  style: TextStyle(
                    color: Colors.white, // Cost text color
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  coupon.mealType.intoString(),
                  style: TextStyle(
                    color: Colors.white70, // Meal type text color
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
