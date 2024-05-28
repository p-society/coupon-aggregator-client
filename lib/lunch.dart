import 'package:flutter/material.dart';
import 'coupon.dart';
import 'package:dio/dio.dart';

class LunchScreen extends StatefulWidget {
  final List<Coupon> coupons;

  const LunchScreen({Key? key, required this.coupons}) : super(key: key);

  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  List<dynamic>? jsonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts'); // Example URL
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
        title: const Text("Lunch Coupons"),
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
