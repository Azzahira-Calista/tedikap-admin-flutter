import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/order_status_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/status_card_2.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/status_card_4.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/status_card_1.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/status_card_3.dart';
import 'package:tedikap_admin/routes/AppPages.dart';
import '../../../data/model/order/order items/order_item_model.dart';
import '../../../data/model/order/order items/order_reward_item.dart';

class OrderStatus extends GetView<OrderStatusController> {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    // final arguments = Get.arguments as Map<String, dynamic>?;

    // Fallback for missing or null arguments
    if (Get.arguments == null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Detail Order',
            style: appBarText,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.toNamed(Routes.NAVBAR + Routes.ORDER);
            },
          ),
        ),
        body: const SafeArea(
          child: Center(
            child: Text('No arguments provided'),
          ),
        ),
      );
    }

    // final String? status = arguments['status'];
    // final String? id = arguments['id'];
    // final int? userId = arguments['userId'];
    // final int? cartId = arguments['cartId'];
    // final String? name = arguments['name'];
    // final String? avatar = arguments['avatar'];
    // final int? voucherId = arguments['voucherId'];
    // final int? totalPrice = arguments['totalPrice'];
    // final int? discountAmount = arguments['discountAmount'];
    // final int? rewardPoint = arguments['rewardPoint'];
    // final int? originalPrice = arguments['originalPrice'];
    // final String? createdAt = arguments['createdAt'];
    // final String? updatedAt = arguments['updatedAt'];
    // final String? schedulePickup = arguments['schedulePickup'];
    // final List<OrderItems>? orderItems = arguments['orderItems'];
    // final String? paymentChannel = arguments['paymentChannel'];
    // final List<OrderRewardItems>? orderRewardItems =
    //     arguments['orderRewardItems'];
    // final String? whatsappUser = arguments['whatsappUser'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Order',
          style: appBarText,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                      ()  {
                        if (controller.isLoading.value){
                          return const Center(child: CircularProgressIndicator());
                        }

                        return _getStatusWidget(
                          status: controller.status?.value,
                          id: controller.id?.value,
                          userId: controller.userId?.value,
                          cartId: controller.cartId?.value,
                          name: controller.name!.value,
                          avatar: controller.avatar!.value,
                          voucherId: controller.voucherId?.value,
                          totalPrice: controller.totalPrice?.value,
                          discountAmount: controller.discountAmount?.value,
                          rewardPoint: controller.rewardPoint?.value,
                          originalPrice: controller.originalPrice?.value,
                          createdAt: controller.createdAt?.value,
                          updatedAt: controller.updatedAt?.value,
                          schedulePickup: controller.schedulePickup?.value,
                          orderItems: controller.orderItems?.value,
                          orderRewardItems: controller.orderRewardItems?.value,
                          paymentChannel: controller.paymentChannel?.value,
                          whatsappUser: controller.whatsappUser?.value,
                        );
                      }
              )
            ),
            // Text(status ?? 'No status'),
          ],
        ),
      ),
    );
  }

  Widget _getStatusWidget({
    required String? status,
    required String? id,
    required int? userId,
    required int? cartId,
    int? voucherId,
    required String name,
    required String avatar,
    required int? totalPrice,
    required int? discountAmount,
    required int? rewardPoint,
    required int? originalPrice,
    required String? createdAt,
    required String? updatedAt,
    required String? schedulePickup,
    List<OrderItems>? orderItems,
    List<OrderRewardItems>? orderRewardItems,
    required String? paymentChannel,
    required String? whatsappUser,
  }) {
    if (status == null) {
      return const Center(child: Text('No status available'));
    }

    switch (status) {
      case "menunggu konfirmasi":
        return NewOrderStatus(
          whatsappUser: whatsappUser!,
          id: id!,
          userId: userId!,
          cartId: cartId!,
          name: name,
          avatar: avatar,
          voucherId: voucherId,
          totalPrice: totalPrice!,
          discountAmount: discountAmount!,
          rewardPoint: rewardPoint!,
          originalPrice: originalPrice!,
          status: status,
          paymentChannel: paymentChannel!,
          createdAt: createdAt!,
          updatedAt: updatedAt!,
          schedulePickup: schedulePickup!,
          orderItems: orderItems,
          orderRewardItems: orderRewardItems,
        );
      case "pesanan diproses":
        return ProcessedOrderStatus(
          whatsappUser: whatsappUser!,
          id: id!,
          userId: userId!,
          cartId: cartId!,
          name: name,
          avatar: avatar,
          voucherId: voucherId,
          totalPrice: totalPrice!,
          discountAmount: discountAmount!,
          rewardPoint: rewardPoint!,
          originalPrice: originalPrice!,
          status: status,
          paymentChannel: paymentChannel!,
          createdAt: createdAt!,
          updatedAt: updatedAt!,
          schedulePickup: schedulePickup!,
          orderItems: orderItems,
          orderRewardItems: orderRewardItems,
        );
      case "pesanan siap diambil":
        return TakenOrderStatus(
          whatsappUser: whatsappUser!,
          id: id!,
          userId: userId!,
          cartId: cartId!,
          name: name,
          avatar: avatar,
          voucherId: voucherId,
          totalPrice: totalPrice!,
          discountAmount: discountAmount!,
          rewardPoint: rewardPoint!,
          originalPrice: originalPrice!,
          status: status,
          paymentChannel: paymentChannel!,
          createdAt: createdAt!,
          updatedAt: updatedAt!,
          schedulePickup: schedulePickup!,
          orderItems: orderItems,
          orderRewardItems: orderRewardItems,
        );
      case "pesanan selesai" || "pesanan ditolak" || "pesanan dibatalkan":
        return HistoryOrderStatus(
          whatsappUser: whatsappUser!,
          id: id!,
          userId: userId!,
          cartId: cartId!,
          name: name,
          avatar: avatar,
          voucherId: voucherId,
          totalPrice: totalPrice!,
          discountAmount: discountAmount!,
          rewardPoint: rewardPoint!,
          originalPrice: originalPrice!,
          status: status,
          paymentChannel: paymentChannel!,
          createdAt: createdAt!,
          updatedAt: updatedAt!,
          schedulePickup: schedulePickup!,
          orderItems: orderItems,
          orderRewardItems: orderRewardItems,
        );
      default:
        return const Center(child: Text("Unknown status"));
    }
  }
}
