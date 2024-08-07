import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/enums/enums.dart';
import 'package:mess_mgmt/Global/models/coupon_model.dart';
import 'package:mess_mgmt/features/dashboard/stores/dashboard_store.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController costController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final store = dashboardStore;
    breakfastCount = store.breakfastCount;
    lunchCount = store.lunchCount;
    dinnerCount = store.dinnerCount;
  }

  Floor selectedFloor = Floor.ground;
  MealType selectedMealType = MealType.nonVeg;
  int breakfastCount = 0;
  int lunchCount = 0;
  int dinnerCount = 0;

  Future<void> _selectDate() async {
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
        return AlertDialog(
          title: const Text("Enter coupon details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButtonFormField<Floor>(
                value: selectedFloor,
                decoration: const InputDecoration(labelText: "Floor"),
                items: Floor.values.map((Floor value) {
                  return DropdownMenuItem<Floor>(
                    value: value,
                    child: Text(value.intoString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedFloor = newValue!;
                  });
                },
              ),
              DropdownButtonFormField<MealType>(
                value: selectedMealType,
                decoration: const InputDecoration(labelText: "Veg or Non-veg"),
                items: MealType.values.map((MealType value) {
                  return DropdownMenuItem<MealType>(
                    value: value,
                    child: Text(value.intoString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedMealType = newValue!;
                  });
                },
              ),
              TextFormField(
                controller: costController,
                decoration: const InputDecoration(labelText: "Cost"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Submit"),
              onPressed: () {
                Floor floor = selectedFloor;
                MealType mealType = selectedMealType;
                String cost = costController.text;
                CouponModel model = CouponModel(
                    floor: floor,
                    mealTime: mealTimeType,
                    mealType: mealType,
                    cost: int.tryParse(cost) ?? 0);
                dashboardStore.sellCoupon(model);
                costController.clear();

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void breakfast() {
    Navigator.pushNamed(context, "/breakfast.dart");
  }

  void lunch() {
    Navigator.pushNamed(context, "/lunch.dart");
  }

  void dinner() {
    Navigator.pushNamed(context, "/dinner.dart");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coupon Availability"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Breakfast",
                            style: TextStyle(fontSize: 24),
                          ),
                          Observer(builder: (context) {
                            final count = dashboardStore.breakfastCount;
                            return Text(
                              "Count: $count",
                              style: const TextStyle(fontSize: 16),
                            );
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () =>
                                input(context, MealTimeType.breakfast),
                            child: const Icon(Icons.add),
                          ),
                          TextButton(
                            onPressed: breakfast,
                            child: const Text("View"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lunch",
                            style: TextStyle(fontSize: 24),
                          ),
                          Observer(builder: (context) {
                            final count = dashboardStore.lunchCount;
                            return Text(
                              "Count: $count",
                              style: const TextStyle(fontSize: 16),
                            );
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => input(context, MealTimeType.lunch),
                            child: const Icon(Icons.add),
                          ),
                          TextButton(
                            onPressed: lunch,
                            child: const Text("View"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dinner",
                            style: TextStyle(fontSize: 24),
                          ),
                          Observer(builder: (context) {
                            final count = dashboardStore.dinnerCount;
                            return Text(
                              "Count: $count",
                              style: const TextStyle(fontSize: 16),
                            );
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () =>
                                input(context, MealTimeType.dinner),
                            child: const Icon(Icons.add),
                          ),
                          TextButton(
                            onPressed: dinner,
                            child: const Text("View"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
