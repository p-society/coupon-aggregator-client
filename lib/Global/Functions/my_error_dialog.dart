// import 'package:flutter/material.dart';

// bool _errorDisplayed = false; // Global flag to track the display status

// void showMyMessage({required String message, required BuildContext context}) {
//   if (_errorDisplayed) return; // Prevent showing multiple toasts

//   _errorDisplayed = true;

//   final overlay = Overlay.of(context);
//   final overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       bottom: MediaQuery.of(context).size.height *
//           0.02, // Adjust the position as needed
//       left: MediaQuery.of(context).size.width * 0.03,
//       right: MediaQuery.of(context).size.width * 0.03,
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.red.withOpacity(0.9),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(Icons.error_outline, color: Colors.white),
//               const SizedBox(width: 10),
//               Text(
//                 message,
//                 style: const TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );

//   overlay.insert(overlayEntry);

//   Future.delayed(const Duration(seconds: 1, milliseconds: 10), () {
//     overlayEntry.remove();
//     _errorDisplayed = false; // Reset the flag after the toast disappears
//   });
// }
