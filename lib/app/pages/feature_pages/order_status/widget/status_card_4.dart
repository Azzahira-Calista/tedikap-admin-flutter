// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/widget/contact_customer_button.dart';

import '../../../../../common/themes.dart';
import '../../../../data/model/order/order items/order_item_model.dart';
import '../../../../data/model/order/order items/order_reward_item.dart';
import '../../order_page/order_page_controller.dart';
import 'order_menu.dart';

class HistoryOrderStatus extends GetView<OrderController> {
  // const TakenOrderStatus({super.key});

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
  final String paymentChannel;
  final String createdAt;
  final String updatedAt;
  final String schedulePickup;
  final List<OrderItems>? orderItems;
  final List<OrderRewardItems>? orderRewardItems;
  final String whatsappUser;

  HistoryOrderStatus({
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
    int totalQuantityOrder = (orderItems != null)
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

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        // height: MediaQuery.of(context).size.height * 0.51,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: offColor,
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0.25)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: BoxDecoration(
                  // color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://tedikap-api.rplrus.com/storage/avatar/$avatar"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            name,
                            style: cardText.copyWith(color: primaryTextColor),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(schedulePickup,
                              style: cardText.copyWith(color: darkGrey)),
                          Text(
                            controller.dateFormat
                                .format(DateTime.parse(createdAt)),
                            style: smallText,
                          ),
                        ],
                      ),
                    ])),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Order List",
                    style: cardText,
                  ),
                ),
                // SizedBox(
                // height: MediaQuery.sizeOf(context).height * 0.01,
                // ),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(id,
                            style:
                                normalText.copyWith(color: primaryTextColor))),
                    IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: id));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Copied to clipboard',
                                style: normalText,
                              ),
                              backgroundColor: lightGrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.copy,
                          size: 16,
                        ))
                  ],
                ),
                // SizedBox(
                //   height: MediaQuery.sizeOf(context).height * 0.02,
                // ),

                OrderMenu(
                  orderItems: orderItems,
                  orderRewardItems: orderRewardItems,
                ),

                Divider(
                  color: offColor,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Order :", style: cardTitle),
                          if (orderItems != null && orderItems!.isNotEmpty) ...[
                            Text(totalQuantityOrder.toString() + " items",
                                style: cardTitle),
                          ],
                          if (orderRewardItems != null &&
                              orderRewardItems!.isNotEmpty) ...[
                            Text(totalQuantityReward.toString() + " items",
                                style: cardTitle),
                          ],
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Price :", style: cardTitle),
                          Row(
                            children: [
                              if (orderItems != null &&
                                  orderItems!.isNotEmpty) ...[
                                Text(
                                  "Rp " + totalPrice.toString(),
                                  style: cardTitle,
                                ),
                              ],
                              if (orderRewardItems != null &&
                                  orderRewardItems!.isNotEmpty) ...[
                                Text(
                                  totalPoints.toString() + " Points",
                                  style: cardTitle,
                                ),
                              ],
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Payment Method :", style: cardTitle),
                          if (orderItems != null && orderItems!.isNotEmpty) ...[
                            Text(paymentChannel, style: cardTitle),
                          ],
                          if (orderRewardItems != null &&
                              orderRewardItems!.isNotEmpty) ...[
                            Text("Pay With Points", style: cardTitle),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                ContactCustomerButton(whatsappUser: whatsappUser),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
