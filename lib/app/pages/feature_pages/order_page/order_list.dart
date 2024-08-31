import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/custom_tab.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_new_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_processed_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_taken_order.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class OrderList extends GetView<OrderController> {
  const OrderList({super.key});

  Future<void> refreshData() async {
    print("Refresh started");
    await Future.wait([
      controller.getOrdersByStatusNew(null),
      controller.getOrdersByStatusProcessed(null),
      controller.getOrdersByStatusTaken(null),
      controller.fetchOrderCount(),
    ]);
    print("Refresh completed");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                refreshData();
              },
              icon: const Icon(Icons.replay_circle_filled_rounded),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.HISTORY_PAGE);
                },
                icon: const Icon(Icons.history),
              ),
            ],
            automaticallyImplyLeading: false,
            title: Text(
              "Order List",
              style: appBarText,
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Obx(() {
                return TabBar(
                  unselectedLabelColor: offColor,
                  labelColor: primaryColor,
                  indicatorColor: primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    customTab("New Order", controller.newOrderResponseModel.length),
                    customTab("Processed", controller.processedOrderResponseModel.length),
                    customTab("Taken", controller.takenOrderResponseModel.length),
                  ],
                );
              }),
            ),
          ),
          body: const TabBarView(
            children: [
              NewOrder(),
              ProcessedOrder(),
              TakenOrder(),
            ],
          ),
        ),
      ),
    );
  }
}
