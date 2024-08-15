import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/bottom_sheet_filter.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_new_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_processed_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/tabs/tab_taken_order.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class OrderList extends GetView<OrderController> {
  final List<String> items = [
    "Newest",
    "Oldest",
    "Pickup",
    "Delivery",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        body: Stack(children: [
          TabBarView(
            children: [
              Scaffold(body: NewOrder()),
              Scaffold(
                body: ProcessedOrder(),
              ),
              Scaffold(
                body: TakenOrder(),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Get.bottomSheet(
                PanelFilter(),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              height: height,
              width: width,
              child: Align(
                alignment: Alignment.bottomCenter,
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
                                style: subTitle.copyWith(color: Colors.white),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
