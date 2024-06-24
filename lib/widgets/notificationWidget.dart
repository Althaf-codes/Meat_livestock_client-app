// import 'package:flutter/material.dart';

// Widget notificationWidget(String text, VoidCallback ontap) {
//   return InkWell(
//     onTap: () {
//       ontap;
//     },
//     child: Container(
//       width: 72,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Icon(Icons.notifications_outlined, color: Colors.black, size: 25),
//               // Text('2', overflow: TextOverflow.ellipsis),
//             ],
//           ),
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//               decoration:
//                   BoxDecoration(shape: BoxShape.circle, color: Colors.red),
//               alignment: Alignment.center,
//               child: Text(
//                 '1',
//                 style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
