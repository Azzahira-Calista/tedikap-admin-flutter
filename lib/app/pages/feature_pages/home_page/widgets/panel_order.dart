import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_card.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class PanelOrder extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());
  // const PanelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
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
                  Get.toNamed(Routes.NAVBAR + Routes.PROMO_VIEW);
                },
                child: Text(
                  "View All",
                  style: normalTextPrimary,
                ),
              )
            ],
          ),
          Container(
            child: Obx(() {
              if (controller.orderResponseModel.isEmpty) {
                return Center(
                  heightFactor: 5,
                  child: Text(
                    'No orders available.',
                    style: normalText,
                  ),
                );
              } else {
                return ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.orderResponseModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    final order = controller.orderResponseModel[index];
                    return OrderCard(
                      id: order.id ?? 'N/A',
                      userId: order.userId ?? 0,
                      cartId: order.cartId ?? 0,
                      voucherId: order.voucherId,
                      totalPrice: order.totalPrice ?? 0,
                      discountAmount: order.discountAmount ?? 0,
                      rewardPoint: order.rewardPoint ?? 0,
                      originalPrice: order.originalPrice ?? 0,
                      status: order.status ?? 'Unknown',
                      paymentChannel: order.paymentChannel ?? 'N/A',
                      createdAt: order.createdAt ?? 'N/A',
                      updatedAt: order.updatedAt ?? 'N/A',
                      schedulePickup: order.schedulePickup ?? 'N/A',
                      orderItems: order.orderItems,
                    );
                  },
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
