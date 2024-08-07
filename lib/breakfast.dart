import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'coupon.dart';

class BreakfastScreen extends StatefulWidget {
  final List<Coupon> coupons;

  const BreakfastScreen({super.key, required this.coupons});

  @override
  _BreakfastScreenState createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  List<dynamic>? jsonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          .get('https://jsonplaceholder.typicode.com/posts'); // Example URL
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data as List;
        });
      } else {
        print(response.statusCode);
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Breakfast Coupons"),
      ),
      body: ListView.builder(
        itemCount: jsonList == null ? 0 : jsonList!.length,
        itemBuilder: (context, index) {
          final coupon = widget.coupons[index];
          return ListTile(
            title: Text(coupon.userName),
            subtitle: Text(
                'Cost: ${coupon.cost}, Floor: ${coupon.floor}, ${coupon.vegNonveg}'),
          );
        },
      ),
    );
  }
}
