// import 'package:flutter/material.dart';

// import '../../../../../common/themes.dart';
// import '../../../../data/model/order/order_item_model.dart';
// import '../../../../data/model/order/order_reward_item.dart';

// class BillingWidget extends StatelessWidget {
//     final int totalPrice;
//   final List<OrderItems>? orderItems;
//   final List<OrderRewardItems>? orderRewardItems;

//   BillingWidget({required this.totalPrice,this.orderItems, this.orderRewardItems});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class OrderBill extends StatelessWidget {
//   final List<OrderItems> orderItems;

//   OrderBill({required this.orderItems});

//   @override
//   Widget build(BuildContext context) {
//     int totalQuantityOrder = orderItems.fold<int>(
//         0, (sum, item) => sum + (item.quantity ?? 0));
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.08,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Total Pesanan :", style: cardTitle),
//                 Text(totalQuantityOrder.toString() + " items",
//                     style: cardTitle),
            
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Total Harga :", style: cardTitle),
//               Row(
//                 children: [
//                   Text(
//                     "Rp ",
//                     style: cardTitle,
//                   ),
//                   if (orderItems != null && orderItems!.isNotEmpty) ...[
//                     Text(
//                       totalp.toString(),
//                       style: cardTitle,
//                     ),
//                   ],
                  
//                   Text(
//                     totalPrice.toString(),
//                     style: cardTitle,
//                   ),
//                 ],
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Metode Pembayaran :", style: cardTitle),
//               if (orderItems != null && orderItems!.isNotEmpty) ...[
//                 Text(paymentChannel, style: cardTitle),
//               ],
//               if (orderRewardItems != null && orderRewardItems!.isNotEmpty) ...[
//                 Text("Bayar dengan Points", style: cardTitle),
//               ],
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// // return Container(
// //                 height: MediaQuery.of(context).size.height * 0.08,
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Text("Total Pesanan :", style: cardTitle),
// //                         if (orderItems != null && orderItems!.isNotEmpty) ...[
// //                           Text(totalQuantityOrder.toString() + " items",
// //                               style: cardTitle),
// //                         ],
// //                         if (orderRewardItems != null &&
// //                             orderRewardItems!.isNotEmpty) ...[
// //                           Text(totalQuantityReward.toString() + " items",
// //                               style: cardTitle),
// //                         ],
// //                       ],
// //                     ),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Text("Total Harga :", style: cardTitle),
// //                         Row(
// //                           children: [
// //                             Text(
// //                               "Rp ",
// //                               style: cardTitle,
// //                             ),
// //                             if (orderItems != null && orderItems!.isNotEmpty) ...[
// //                               Text(
// //                                 totalPrice.toString(),
// //                                 style: cardTitle,
// //                               ),
// //                             ],
// //                             if (orderRewardItems != null &&
// //                                 orderRewardItems!.isNotEmpty) ...[
// //                               Text(
// //                                 orderRew.toString(),
// //                                 style: cardTitle,
// //                               ),
// //                             ],
// //                             Text(
// //                               totalPrice.toString(),
// //                               style: cardTitle,
// //                             ),
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Text("Metode Pembayaran :", style: cardTitle),
// //                         if (orderItems != null && orderItems!.isNotEmpty) ...[
// //                           Text(paymentChannel, style: cardTitle),
// //                         ],
// //                         if (orderRewardItems != null &&
// //                             orderRewardItems!.isNotEmpty) ...[
// //                           Text("Bayar dengan Points", style: cardTitle),
// //                         ],
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),