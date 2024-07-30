import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_card.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class PanelOrder extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());
  // const PanelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Orders",
                style: normalText.copyWith(fontSize: 15),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.NAVBAR + Routes.ORDER);
                },
                child: Container(
                  color: lightGrey,
                  width: 80,
                  height: 30,
                  child: Text(
                    "View All",
                    style: normalTextPrimary,
                  ),
                ),
              ),
              
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          Container(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  heightFactor: 5,
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.newOrderResponseModel.isEmpty) {
                return Center(
                  heightFactor: 5,
                  child: Text(
                    'No orders available.',
                    style: normalText,
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
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
                      );
                    },
                  ),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
