import 'package:flutter/material.dart';
import 'package:mess_mgmt/Global/models/coupon_data_model.dart';
import 'package:mess_mgmt/Global/widgets/my_list_tile.dart';

class GlassyListTile extends StatelessWidget {
  final CouponDataModel coupon;
  final int i;

  const GlassyListTile({
    super.key,
    required this.coupon,
    required this.i,
  });
  @override
  Widget build(BuildContext context) {
    return MyListTile(coupon: coupon);
  }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         color: Colors.blueAccent,
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.2),
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: Colors.white.withOpacity(0.3),
//               width: 1.5,
//             ),
//           ),
//           child: ListTile(
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//             title: Text(
//               coupon.createdBy?.fName ?? '',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             subtitle: Text(
//               "Floor: ${coupon.couponFloor}",
//               style: const TextStyle(
//                 color: Colors.white70,
//               ),
//             ),
//             trailing: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Rs ${coupon.price}",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   coupon.isVeg ? 'Veg' : 'Non-Veg',
//                   style: const TextStyle(
//                     color: Colors.white70,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
}
