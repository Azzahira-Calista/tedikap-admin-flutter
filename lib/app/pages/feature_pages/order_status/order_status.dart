import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/status/taken_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/order_status_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/status_card_2.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/status_card_1.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/status_card_3.dart';
import '../../../data/model/order/order_item_model.dart';

class OrderStatus extends GetView<OrderStatusController> {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;

    // Fallback for missing or null arguments
    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Detail Order',
            style: appBarText,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Text('No arguments provided'),
          ),
        ),
      );
    }

    final String? status = arguments['status'];
    final String? id = arguments['id'];
    final int? userId = arguments['userId'];
    final int? cartId = arguments['cartId'];
    final int? voucherId = arguments['voucherId'];
    final int? totalPrice = arguments['totalPrice'];
    final int? discountAmount = arguments['discountAmount'];
    final int? rewardPoint = arguments['rewardPoint'];
    final int? originalPrice = arguments['originalPrice'];
    final String? createdAt = arguments['createdAt'];
    final String? updatedAt = arguments['updatedAt'];
    final String? schedulePickup = arguments['schedulePickup'];
    final List<OrderItems>? orderItems = arguments['orderItems'];
    final String? paymentChannel = arguments['paymentChannel'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Order',
          style: appBarText,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _getStatusWidget(
                status: status,
                id: id,
                userId: userId,
                cartId: cartId,
                voucherId: voucherId,
                totalPrice: totalPrice,
                discountAmount: discountAmount,
                rewardPoint: rewardPoint,
                originalPrice: originalPrice,
                createdAt: createdAt,
                updatedAt: updatedAt,
                schedulePickup: schedulePickup,
                orderItems: orderItems,
                paymentChannel: paymentChannel,
              ),
            ),
            Text(status ?? 'No status'),
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
    required int? voucherId,
    required int? totalPrice,
    required int? discountAmount,
    required int? rewardPoint,
    required int? originalPrice,
    required String? createdAt,
    required String? updatedAt,
    required String? schedulePickup,
    required List<OrderItems>? orderItems,
    required String? paymentChannel,
  }) {
    if (status == null) {
      return Center(child: Text('No status available'));
    }

    switch (status) {
      case "menunggu konfirmasi":
        return NewOrderStatus();
      case "pesanan diproses":
        return ProcessedOrderStatus();
      case "pesanan siap diambil":
      case "pesanan selesai":
      case "menunggu pembayaran":
        return TakenOrderStatus(
          id: id!,
          userId: userId!,
          cartId: cartId!,
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
          orderItems: orderItems!,
        );
      default:
        return Center(child: Text("Unknown status"));
    }
  }
}

