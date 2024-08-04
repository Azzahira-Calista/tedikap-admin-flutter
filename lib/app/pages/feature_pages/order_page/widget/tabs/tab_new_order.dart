import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';

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
    return SafeArea(
      child: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: refreshData,
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.newOrderResponseModel.isEmpty) {
            return ListView(children: [
              Container(
                height: Get.height * 0.7,
                child: Center(
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
                ),
              ),
            ]);
          }
          return Expanded(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  orderRewardItems: order.orderRewardItems,
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
