import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import 'package:mess_mgmt/Global/theme/app_theme.dart';
import 'package:mess_mgmt/Global/widgets/custom_error_messenger.dart';
import 'package:mess_mgmt/Global/widgets/loader.dart';
import 'package:mess_mgmt/features/dashboard/screens/view_screen.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';
import 'package:mess_mgmt/features/dashboard/widgets/dashboard_drawer.dart';
import 'package:mobx/mobx.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final store = dashboardStore;
    breakfastCount = store.breakfastCount;
    lunchCount = store.lunchCount;
    dinnerCount = store.dinnerCount;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward();
    dateController.text = DateTime.now().toString().split(' ')[0];
  }

  Floor selectedFloor = Floor.ground;
  MealType selectedMealType = MealType.nonVeg;
  int breakfastCount = 0;
  int lunchCount = 0;
  int dinnerCount = 0;
  final costController = TextEditingController(text: '0');

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 7),
      ),
    );
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  void input(BuildContext context, MealTimeType mealTimeType) {
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    items: Floor.values.map((Floor value) {
                      return DropdownMenuItem<Floor>(
                        value: value,
                        child: Text(
                          value.intoString(),
                          style: const TextStyle(color: Colors.white),
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
                      labelStyle: TextStyle(color: Colors.white),
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
                  Observer(builder: (context) {
                    final isLoading = dashboardStore.isLoading;
                    if (isLoading) {
                      return const Center(child: AppLoader());
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white.withOpacity(0.8),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white.withOpacity(0.8),
                          ),
                          onPressed: () async {
                            Floor floor = selectedFloor;
                            MealType mealType = selectedMealType;
                            String cost = costController.text;
                            CouponModel model = CouponModel(
                                floor: floor,
                                mealTime: mealTimeType,
                                mealType: mealType,
                                cost: int.tryParse(cost) ?? 0);
                            await dashboardStore.sellCoupon(model).then((_) {
                              costController.clear();
                              Navigator.of(context).pop();
                            });
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
        );
      },
    );
  }

  void navigateToViewScreen() {
    navigateToNextScreen(
      nextScreen: const ViewScreen(),
      context: context,
    );
  }

  int getCount(MealTimeType type) {
    switch (type) {
      case MealTimeType.breakfast:
        return dashboardStore.totalBreakfastAvailable;
      case MealTimeType.lunch:
        return dashboardStore.totalLunchAvailable;
      case MealTimeType.dinner:
        return dashboardStore.totalDinnerAvailable;
    }
  }

  @override
  Widget build(BuildContext context) {
    /* double widthFactor = MediaQuery.of(context).width; */
    return ReactionBuilder(
      builder: (context) {
        return autorun((_) {
          final isLoading = dashboardStore.isLoading;
          final error = appState.authError;
          if (error != null && !isLoading) {
            showError(
              context,
              error.errorDescription,
              error.errorString,
            );
            appState.authError = null;
          }
        });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Coupon Availability'),
          actions: [
            IconButton(
                onPressed: () async {
                },
                icon: const Icon(Icons.abc))
          ],
        ),
        drawer: const DashboardDrawer(),
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppTheme.linearGradient(),
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildDatePicker(),
                      const SizedBox(height: 24),
                      for (final e in MealTimeType.values) ...[
                        Observer(builder: (context) {
                          int count = getCount(e);
                          return _buildMealCard(
                              e.intoTitle(), e.getIcon(), count, e);
                        }),
                        const SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                dateController.text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealCard(
      String title, IconData icon, int count, MealTimeType mealType) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - _animationController.value)),
          child: Opacity(
            opacity: _animationController.value,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(icon,
                                size: 24,
                                color: Theme.of(context).primaryColor),
                            const SizedBox(width: 12),
                            Text(title,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Text(
                          'Available : $count',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => input(
                            context,
                            mealType,
                          ),
                          icon: const Icon(Icons.add),
                          label: const Text('Sell'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            dashboardStore.currentView = mealType;

                            navigateToViewScreen();
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),
                          child: const Text(
                            'View',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
