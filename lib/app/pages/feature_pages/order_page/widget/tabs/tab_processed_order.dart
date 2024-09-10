import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/bottom_sheet_filter.dart';

import '../../../../../../common/constant.dart';
import '../../../../../../common/themes.dart';
import '../order_card.dart';

class ProcessedOrder extends GetView<OrderController> {
  const ProcessedOrder({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (controller.processedOrderResponseModel.isEmpty) {
              return ListView(children: [
                SizedBox(
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
                        const SizedBox(height: 20),
                        Text('No order available', style: normalText),
                      ],
                    ),
                  ),
                ),
              ]);
            }
            return Column(
              children: [
                Expanded(child:
                ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: controller.processedOrderResponseModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    final order =
                    controller.processedOrderResponseModel[index];
                    return OrderCard(
                      whatsappUser: order.whatsappUser!,
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
                      schedulePickup: order.schedulePickup ?? '',
                      orderItems: order.orderItems,
                      orderRewardItems: order.orderRewardItems,
                    );
                  },
                ),
                )

              ],
            );
          }),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            // height: height,
            // width: width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    PanelFilter(statusType: 'proccess'),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: height * 0.06,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.filter_alt_outlined,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                          width: width * 0.15,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Filter',
                                style:
                                    subTitle.copyWith(color: Colors.white),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
