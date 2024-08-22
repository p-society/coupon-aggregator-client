import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/features/User%20Profile/store/user_profile_store.dart';
import 'package:mobx/mobx.dart';
import '../enums/enums.dart';
import '../models/coupon_data_model.dart';
import '../widgets/loader.dart';

void showEditCouponDialog(
    {required BuildContext context, required CouponDataModel coupon}) {
  appState.canDialogPop = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DialogWidget(coupon: coupon);
    },
  );
}

class DialogWidget extends StatefulWidget {
  const DialogWidget({
    super.key,
    required this.coupon,
  });

  final CouponDataModel coupon;

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  late Floor selectedFloor;
  late MealType selectedMealType;
  late MealTimeType mealTimeType;
  late CouponStatus couponStatus;

  @override
  void initState() {
    super.initState();
    mealTimeType = mealTimeTypeMap[widget.coupon.couponType]!;
    selectedFloor = floorMap[widget.coupon.couponFloor]!;
    selectedMealType = widget.coupon.isVeg ? MealType.veg : MealType.nonVeg;
    costController =
        TextEditingController(text: widget.coupon.price.toString());
    couponStatus = couponStatusMap[widget.coupon.status]!;
  }

  late final TextEditingController costController;

  @override
  void dispose() {
    costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              color: Colors.white
                  .withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Enter coupon details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Floor>(
                  value: selectedFloor,
                  decoration: const InputDecoration(
                    labelText: "Floor",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ), 
                  ),
                  items: Floor.values.map((Floor value) {
                    return DropdownMenuItem<Floor>(
                      value: value,
                      child: Text(
                        value.intoString(),
                        style: const TextStyle(
                            color: Colors
                                .white), 
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedFloor = newValue!;
                    });
                  },
                  dropdownColor: Colors.blueAccent,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<MealType>(
                  value: selectedMealType,
                  decoration: const InputDecoration(
                    labelText: "Veg or Non-veg",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  items: MealType.values.map((MealType value) {
                    return DropdownMenuItem<MealType>(
                      value: value,
                      child: Text(
                        value.intoString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedMealType = newValue!;
                    });
                  },
                  dropdownColor: Colors.blueAccent,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: costController,
                  decoration: const InputDecoration(
                    labelText: "Cost",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Coupon Status',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    FilterChip.elevated(
                      selected: couponStatus == CouponStatus.active,
                      label: Text(CouponStatus.active.intoString()),
                      onSelected: (val) {
                        if (val) {
                          couponStatus = CouponStatus.active;
                          setState(() {});
                        }
                      },
                    ),
                    FilterChip.elevated(
                      selected: couponStatus == CouponStatus.sold,
                      label: Text(CouponStatus.sold.intoString()),
                      onSelected: (val) {
                        if (val) {
                          couponStatus = CouponStatus.sold;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Observer(builder: (context) {
                  final isLoadingLoally = userProfileStore.isLoadingLocally;
                  if (isLoadingLoally) {
                    return const Center(child: AppLoader());
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ReactionBuilder(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white.withOpacity(0.8),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel"),
                          ),
                          builder: (context) {
                            return autorun((_) {
                              final canDialogPop =
                                  appState.canDialogPop;
                              if (canDialogPop) {
                                Navigator.pop(context);
                              }
                            });
                          }),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white.withOpacity(0.8),
                        ),
                        onPressed: () async {
                          Floor floor = selectedFloor;
                          MealType mealType = selectedMealType;
                          String cost = costController.text;
                          final model = widget.coupon.copyWith(
                            price: int.parse(cost),
                            couponType: mealTimeType.intoString(),
                            isVeg: mealType.intoBool(),
                            couponFloor: floor.intoInt(),
                            status: couponStatus.intoString(),
                          );
                          userProfileStore.updateCoupon(coupon: model);
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
