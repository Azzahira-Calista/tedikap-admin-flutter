import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/history_page/history_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_card.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../common/constant.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  Future<void> _refreshData() async {
    await controller.getHistoryOrder();
    await controller.getHistoryOrderReward();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _tabs = ['common', 'reward'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "History orders",
          style: appBarText,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: _tabs.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          controller.changeIndex(index);
                          // _refreshData();
                        },
                        child: Obx(() => ChipTheme(
                              data: ChipTheme.of(context).copyWith(
                                side: controller.selectrdTab.value ==
                                        _tabs[index]
                                    ? BorderSide(color: primaryColor, width: 1)
                                    : BorderSide(color: offColor, width: 1),
                              ),
                              child: Chip(
                                label: Text(
                                  _tabs[index],
                                  style: subTitle.copyWith(
                                    color: controller.selectrdTab.value ==
                                            _tabs[index]
                                        ? primaryColor
                                        : offColor,
                                  ),
                                ),
                                backgroundColor:
                                    controller.selectrdTab.value == _tabs[index]
                                        ? white
                                        : white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.orderResponseModel.isEmpty) {
                  return Expanded(
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
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: controller.orderResponseModel.length,
                    itemBuilder: (context, index) {
                      final order = controller.orderResponseModel[index];
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
    );
  }
}
