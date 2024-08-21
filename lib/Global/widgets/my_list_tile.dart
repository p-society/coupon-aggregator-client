// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';

// ignore: must_be_immutable
class MyListTile extends StatelessWidget {
  final CouponDataModel coupon;
  MyListTile({super.key, required this.coupon});

  var isVeg = true;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Container(
            height: 120,
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12)),
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                "${coupon.couponType}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            )),
        SizedBox(
          width: 2,
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(129, 15, 123, 211),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${coupon.createdBy?.fName}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        Text("${coupon.couponDate}     ${coupon.couponFloor}",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                          child: Row(
                            children: [
                              Icon(Icons.phone,
                                  color:
                                      const Color.fromARGB(216, 255, 255, 255)),
                              SizedBox(width: 20),
                              Icon(Icons.chat,
                                  color:
                                      const Color.fromARGB(216, 255, 255, 255)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${coupon.price}",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 28,
                              fontWeight: FontWeight.w500)),
                      SvgPicture.asset(
                        "assets/svg_image/isVeg.svg",
                        width: 60,
                        height: 60,
                        colorFilter: ColorFilter.mode(
                            coupon.isVeg
                                ? Color.fromARGB(255, 33, 134, 37)
                                : Color.fromARGB(255, 179, 40, 30),
                            BlendMode.srcIn),
                      )
                    ],
                  )
                ],
              )),
        )
      ],
    ));
  }
}
