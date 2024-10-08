import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/common/format.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../../data/model/order/order items/order_item_model.dart';
import '../../../../data/model/order/order items/order_reward_item.dart';

class OrderCard extends GetView<OrderController> {
  final String id;
  final int userId;
  final int cartId;
  final String name;
  final String avatar;
  final int? voucherId;
  final int totalPrice;
  final int discountAmount;
  final int rewardPoint;
  final int originalPrice;
  final String status;
  final String orderType;
  final String paymentChannel;
  final String createdAt;
  final String updatedAt;
  final String? schedulePickup;
  final List<OrderItems>? orderItems;
  final List<OrderRewardItems>? orderRewardItems;
  final String whatsappUser;

  const OrderCard({
    super.key,
    required this.id,
    required this.userId,
    required this.cartId,
    required this.name,
    required this.avatar,
    this.voucherId,
    required this.totalPrice,
    required this.discountAmount,
    required this.rewardPoint,
    required this.originalPrice,
    required this.status,
    required this.orderType,
    required this.paymentChannel,
    required this.createdAt,
    required this.updatedAt,
    required this.schedulePickup,
    this.orderItems,
    this.orderRewardItems,
    required this.whatsappUser,
  });

  @override
  Widget build(BuildContext context) {
    int totalQuantityOrder = (orderItems?.isNotEmpty ?? false)
        ? orderItems!.fold<int>(0, (sum, item) => sum + (item.quantity ?? 0))
        : 0;
    int totalQuantityReward = (orderRewardItems != null)
        ? orderRewardItems!
            .fold<int>(0, (sum, item) => sum + (item.quantity ?? 0))
        : 0;
    int totalPoints = (orderRewardItems != null)
        ? orderRewardItems!
            .fold<int>(0, (sum, item) => sum + (item.totalPoints ?? 0))
        : 0;

    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          // BoxShadow(
          //     color: offColor,
          //     offset: Offset(0, 4),
          //     blurRadius: 4,
          //     spreadRadius: 0.25)
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://tedikap-api.rplrus.com/storage/avatar/$avatar"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 10),
                Text(name, style: cardText.copyWith(color: white))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_getOrderTitle(),
                        style: cardTitle.copyWith(fontWeight: FontWeight.w500)),
                    Text(status,
                        style: smallText.copyWith(
                            color: offColor, fontWeight: FontWeight.w700)),
                  ],
                ),
                const Divider(color: offColor),
                if (orderItems != null && orderItems!.isNotEmpty) ...[
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        orderItems!
                            .map((item) => "${item.productName} ")
                            .toList()
                            .join(", "),
                        overflow: TextOverflow.ellipsis,
                        style: normalText,
                      )),
                  const SizedBox(height: 10),
                ],
                if (orderRewardItems != null &&
                    orderRewardItems!.isNotEmpty) ...[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      orderRewardItems!
                          .map((item) => "${item.productName} ")
                          .toList()
                          .join(", "),
                      overflow: TextOverflow.ellipsis,
                        style: normalText,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (orderItems != null && orderItems!.isNotEmpty) ...[
                        Text("$totalQuantityOrder items",
                            style: smallText.copyWith(
                                color: offColor, fontWeight: FontWeight.w500)),
                      ],
                      if (orderRewardItems != null &&
                          orderRewardItems!.isNotEmpty) ...[
                        Text("$totalQuantityReward items",
                            style: smallText.copyWith(
                                color: offColor, fontWeight: FontWeight.w500)),
                      ],
                      Row(
                        children: [
                          Text("Total: ",
                              style: smallText.copyWith(
                                  color: offColor,
                                  fontWeight: FontWeight.w500)),
                          if (orderItems != null && orderItems!.isNotEmpty) ...[
                            Text(formatRupiah(totalPrice),
                                style: smallText.copyWith(
                                    color: offColor,
                                    fontWeight: FontWeight.w700)),
                          ],
                          if (orderRewardItems != null &&
                              orderRewardItems!.isNotEmpty) ...[
                            Text("$totalPoints Points",
                                style: smallText.copyWith(
                                    color: offColor,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ],
                      ),
                    ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.ORDER_STATUS, arguments: {
                        'id': id,
                        'userId': userId,
                        'cartId': cartId,
                        'voucherId': voucherId,
                        'totalPrice': totalPrice,
                        'name': name,
                        'avatar': avatar,
                        'discountAmount': discountAmount,
                        'rewardPoint': rewardPoint,
                        'originalPrice': originalPrice,
                        'status': status,
                        'paymentChannel': paymentChannel,
                        'createdAt': createdAt,
                        'updatedAt': updatedAt,
                        'schedulePickup': schedulePickup,
                        'orderItems': orderItems,
                        'orderRewardItems': orderRewardItems,
                        'whatsappUser': whatsappUser
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: primaryColor,
                        foregroundColor: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: Center(
                      child: Text("Detail Order",
                          style: button2.copyWith(color: white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getOrderTitle() {
    if (orderItems != null && orderItems!.isNotEmpty) {
      return "Order Items";
    } else if (orderRewardItems != null && orderRewardItems!.isNotEmpty) {
      return "Order Reward Items";
    } else {
      return "No items available";
    }
  }
}
