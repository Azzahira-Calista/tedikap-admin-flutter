import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_new_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_processed_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_taken_order.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class OrderList extends GetView<OrderController> {
  const OrderList({super.key});

  // final List<String> items = [
  //   "Newest",
  //   "Oldest",
  //   "Pickup",
  //   "Delivery",
  // ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.HISTORY_PAGE);
                },
                icon: Icon(Icons.history))
          ],
          // leading: IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: Icon(Icons.arrow_back_ios),
          // ),
          automaticallyImplyLeading: false,
          title: Text(
            "Order List",
            style: appBarText,
          ),
          centerTitle: true,
          bottom: const TabBar(
            unselectedLabelColor: offColor,
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: ("New Order"),
              ),
              Tab(
                text: ("Processed "),
              ),
              Tab(
                text: ("Taken"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewOrder(),
            ProcessedOrder(),
            TakenOrder(),
          ],
        ),
      ),
    );
  }
}
