import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/bottom_sheet_filter.dart';
import '../../../../../../common/constant.dart';
import '../../../../../../common/themes.dart';
import '../order_card.dart';

class TakenOrder extends GetView<OrderController> {
  const TakenOrder({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            if (controller.takenOrderResponseModel.isEmpty) {
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
                itemCount: controller.takenOrderResponseModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final order = controller.takenOrderResponseModel[index];
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
                    schedulePickup: order.schedulePickup!,
                    orderItems: order.orderItems,
                    orderRewardItems: order.orderRewardItems,
                  );
                },
              ),
            );
          }),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            // height: height,
            // width: width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    PanelFilter(
                      statusType: 'taken',
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
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
                        child: Icon(
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
