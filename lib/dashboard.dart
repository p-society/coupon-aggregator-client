import 'package:flutter/material.dart';
import 'models/coupon.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Coupon> breakfastCoupons = [];
  List<Coupon> lunchCoupons = [];
  List<Coupon> dinnerCoupons = [];
  final TextEditingController costController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  
  String selectedFloor = 'Ground';
  String selectedVegNonveg = 'Veg';
  int breakfastCount = 0;
  int lunchCount = 0;
  int dinnerCount = 0;
  void addCoupon(Coupon coupon, String mealType) {
    setState(() {
      if (mealType == "Breakfast") {
        breakfastCoupons.add(coupon);
      } else if (mealType == "Lunch") {
        lunchCoupons.add(coupon);
      } else if (mealType == "Dinner") {
        dinnerCoupons.add(coupon);
      }
    });
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context, firstDate: DateTime(2024), lastDate: DateTime.now());
    if (_picked != null) {
      setState(() {
        dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  void input(BuildContext context, String mealType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter coupon details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: selectedFloor,
                decoration: const InputDecoration(labelText: "Floor"),
                items: <String>['Ground', 'First'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedFloor = newValue!;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedVegNonveg,
                decoration: const InputDecoration(labelText: "Veg or Non-veg"),
                items: <String>['Veg', 'Non-Veg'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedVegNonveg = newValue!;
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
                String floor = selectedFloor;
                String vegNonveg = selectedVegNonveg;
                String cost = costController.text;
                print('Floor: $floor, Veg/Non-Veg: $vegNonveg, Cost: $cost');
                setState(() {
                  if (mealType == 'Breakfast') {
                    breakfastCount++;
                  }
                  if (mealType == 'Lunch') {
                    lunchCount++;
                  }
                  if (mealType == 'Dinner') {
                    dinnerCount++;
                  }
                });
                // Clear the text fields
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
                          Text(
                            "Count: ${breakfastCoupons.length}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => input(context, 'Breakfast'),
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
                          Text(
                            "Count: ${lunchCoupons.length}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => input(context, 'Lunch'),
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
                          Text(
                            "Count: ${dinnerCoupons.length}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => input(context, 'Dinner'),
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
