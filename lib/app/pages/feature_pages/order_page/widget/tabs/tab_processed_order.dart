import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';

import '../order_card.dart';
import '../order_filter.dart';

class ProcessedOrder extends GetView<OrderController> {
  const ProcessedOrder({super.key});

  Future<void> refreshData() async {
    controller.getOrdersByStatusProcessed();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // OrderFilter(),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.processedOrderResponseModel.isEmpty) {
                    return Center(child: Text('No order available'));
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.processedOrderResponseModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        final order =
                            controller.processedOrderResponseModel[index];
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
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
