import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../order_page_controller.dart';
import '../order_card.dart';
import '../order_filter.dart';

class NewOrder extends GetView<OrderController> {
  const NewOrder({super.key});

  Future<void> refreshData() async {
    controller.getOrdersByStatusNew();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // OrderFilter(),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.newOrderResponseModel.isEmpty) {
                  return Center(child: Text('No order available'));
                }
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.newOrderResponseModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        final order = controller.newOrderResponseModel[index];
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
                          orderRewardItems: [],
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
