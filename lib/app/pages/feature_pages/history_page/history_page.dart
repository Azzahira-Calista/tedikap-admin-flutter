import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/history_page/history_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_card.dart';
import 'package:tedikap_admin/common/themes.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

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
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: _tabs.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  controller.changeIndex(index);
                },
                child: Obx(() => ChipTheme(
                      data: ChipTheme.of(context).copyWith(
                        side: controller.selectrdTab.value == _tabs[index]
                            ? BorderSide(color: primaryColor, width: 2)
                            : BorderSide(color: offColor, width: 1),
                      ),
                      child: Chip(
                        label: Text(
                          _tabs[index],
                          style: subTitle.copyWith(
                            color: controller.selectrdTab.value == _tabs[index]
                                ? white
                                : offColor,
                          ),
                        ),
                        backgroundColor:
                            controller.selectrdTab.value == _tabs[index]
                                ? primaryColor
                                : white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            if (controller.orderResponseModel.isEmpty) {
              return Center(child: Text('No order available'));
            }
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
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
              ),
            );
          }),
        ],
      ),
    );
  }
}
