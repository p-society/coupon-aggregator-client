import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mess_mgmt/Global/Functions/contact_helper_class.dart';
import 'package:mess_mgmt/Global/Functions/format_date.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';

class MyListTile extends StatelessWidget {
  final CouponDataModel coupon;
  const MyListTile({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${coupon.createdBy?.fName}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Date : ${coupon.couponDate!.getDate()}\nFloor : ${coupon.couponFloor}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    ContactHelper.makePhoneCall(
                                        coupon.createdBy!.mobileNumber);
                                  },
                                  child: const Icon(
                                    Icons.phone,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {
                                    ContactHelper.sendSms(
                                        coupon.createdBy!.mobileNumber,
                                        "Hey I want to buy your coupon");
                                  },
                                  child: const Icon(
                                    Icons.chat,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "₹ ${coupon.price}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
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
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
