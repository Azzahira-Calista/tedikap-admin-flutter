import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';

import '../order_card.dart';
import '../order_filter.dart';

class TakenOrder extends GetView<OrderController> {
  const TakenOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            // Container(
            //   height: 34,
            //   margin: EdgeInsets.symmetric(vertical: 20),
            //   width: MediaQuery.of(context).size.width,
            //   child: OrderFilter(),
            // ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (controller.orderResponseModel.isEmpty) {
                return Center(child: Text('No order available'));
              }
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10
                    // MediaQuery.of(context).size.width * 0.02,
                    ),
                child: ListView.builder(
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
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
