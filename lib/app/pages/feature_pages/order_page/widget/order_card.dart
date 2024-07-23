import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../../data/model/order/order_item_model.dart';

class OrderCard extends GetView<OrderController> {
  // const OrderCard({super.key});

  final String id;
  final int userId;
  final int cartId;
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

  OrderCard({
    required this.id,
    required this.userId,
    required this.cartId,
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
  });

  @override
  Widget build(BuildContext context) {
    int totalQuantity = (orderItems?.isNotEmpty ?? false)
        ? orderItems!.fold<int>(0, (sum, item) => sum + (item.quantity ?? 0))
        : 0;

    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
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
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "User's name",
                  style: cardText.copyWith(color: white),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            deliveryIcon,
                            height: 25,
                          ),
                          Text(
                            "Delivery",
                            style: cardTitle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(status,
                        style: smallText.copyWith(
                            color: offColor, fontWeight: FontWeight.w700)),
                  ],
                ),
                Divider(
                  color: offColor,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 180,
                          child: Text(
                            orderItems!
                                .map((item) => item.productName)
                                .join(", "),
                            style: normalText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(totalQuantity.toString() + " items",
                              style: smallText.copyWith(
                                  color: offColor,
                                  fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              Text("Total :",
                                  style: smallText.copyWith(
                                      color: offColor,
                                      fontWeight: FontWeight.w500)),
                              Text(totalPrice.toString(),
                                  style: smallText.copyWith(
                                      color: offColor,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.015),
                      Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.ORDER_STATUS, arguments: {
                              'id': id,
                              'userId': userId,
                              'cartId': cartId,
                              'voucherId': voucherId,
                              'totalPrice': totalPrice,
                              'discountAmount': discountAmount,
                              'rewardPoint': rewardPoint,
                              'originalPrice': originalPrice,
                              'status': status,
                              'paymentChannel': paymentChannel,
                              'createdAt': createdAt,
                              'updatedAt': updatedAt,
                              'schedulePickup': schedulePickup,
                              'orderItems': orderItems,
                              });
                            },
                            child: Center(
                              child: Text("Detail Pesanan",
                                  style: button2.copyWith(color: white)),
                            ),
                            style: ElevatedButton.styleFrom(
                                // primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                backgroundColor: primaryColor,
                                foregroundColor: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
