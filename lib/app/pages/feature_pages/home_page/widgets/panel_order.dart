// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
// import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
// import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_card.dart';
// import 'package:tedikap_admin/common/themes.dart';
// import 'package:tedikap_admin/routes/AppPages.dart';

// import '../../../../../common/constant.dart';
// import '../../../global_components/navbar/navbar_controller.dart';

// class PanelOrder extends GetView<HomeController> {
//   final OrderController orderController = Get.put(OrderController());
//   // const PanelOrder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//       margin: EdgeInsets.only(top: screenHeight * 0.05),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "New Orders",
//                 style: normalText.copyWith(fontSize: 15),
//               ),
//               InkWell(
//                 // onTap: () {
//                 //   Get.toNamed(Routes.NAVBAR + Routes.ORDER);
//                 // },
//                 onTap: () {
//                   Get.find<NavigationController>().currentPage.value = 2;
//                 },

//                 child: Text(
//                   "View All",
//                   style: normalTextPrimary,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.04,
//           ),
//           Container(
//             child: Obx(() {
//               if (orderController.isLoading.value) {
//                 return Center(
//                   heightFactor: 5,
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (orderController.newOrderResponseModel.isEmpty) {
//                 return ListView(children: [
//                   Container(
//                     height: MediaQuery.sizeOf(context).height * 0.7,
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             orderEmptyIcon,
//                             width: 150,
//                             height: 150,
//                           ),
//                           SizedBox(height: 20),
//                           Text('No order available', style: normalText),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ]);
//               } else {
//                 return SingleChildScrollView(
//                   child: ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: orderController.newOrderResponseModel.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final order =
//                           orderController.newOrderResponseModel[index];
//                       return OrderCard(
//                         id: order.id!,
//                         userId: order.userId!,
//                         cartId: order.cartId ?? 0,
//                         name: order.name!,
//                         avatar: order.avatar!,
//                         voucherId: order.voucherId,
//                         totalPrice: order.totalPrice ?? 0,
//                         discountAmount: order.discountAmount ?? 0,
//                         rewardPoint: order.rewardPoint ?? 0,
//                         originalPrice: order.originalPrice ?? 0,
//                         status: order.status!,
//                         orderType: order.orderType ?? '0',
//                         paymentChannel: order.paymentChannel ?? '0',
//                         createdAt: order.createdAt.toString(),
//                         updatedAt: order.updatedAt.toString(),
//                         schedulePickup: order.schedulePickup!,
//                         orderItems: order.orderItems,
//                         orderRewardItems: order.orderRewardItems,
//                       );
//                     },
//                   ),
//                 );
//               }
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_card.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';
import '../../../global_components/navbar/navbar_controller.dart';

class PanelOrder extends GetView<HomeController> {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Orders",
                style: normalText.copyWith(fontSize: 15),
              ),
              InkWell(
                onTap: () {
                  Get.find<NavigationController>().currentPage.value = 2;
                },
                child: Text(
                  "View All",
                  style: normalTextPrimary,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            child: Obx(() {
              if (orderController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (orderController.newOrderResponseModel.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        orderEmptyIcon,
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      Text('No order available', style: normalText),
                    ],
                  ),
                );
              } else {
                // Limit the number of orders to 3
                final limitedOrders = orderController.newOrderResponseModel.take(3).toList();
                return ListView.builder(
                  itemCount: limitedOrders.length,
                  itemBuilder: (BuildContext context, int index) {
                    final order = limitedOrders[index];
                    return OrderCard(
                      id: order.id!,
                      userId: order.userId!,
                      cartId: order.cartId ?? 0,
                      name: order.name!,
                      avatar: order.avatar!,
                      voucherId: order.voucherId,
                      totalPrice: order.totalPrice ?? 0,
                      discountAmount: order.discountAmount ?? 0,
                      rewardPoint: order.rewardPoint ?? 0,
                      originalPrice: order.originalPrice ?? 0,
                      status: order.status!,
                      orderType: order.orderType ?? '0',
                      paymentChannel: order.paymentChannel ?? '0',
                      createdAt: order.createdAt.toString(),
                      updatedAt: order.updatedAt.toString(),
                      schedulePickup: order.schedulePickup!,
                      orderItems: order.orderItems,
                      orderRewardItems: order.orderRewardItems,
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
