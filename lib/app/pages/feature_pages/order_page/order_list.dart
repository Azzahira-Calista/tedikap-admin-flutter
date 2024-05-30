import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_card.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/order_filter.dart';

class OrderList extends StatelessWidget {
  OrderController controller = Get.put(OrderController());

  @override
  final List<String> items = [
    "Newest",
    "Oldest",
    "Pickup",
    "Delivery",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
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
            Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 34,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    child: OrderFilter(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10
                        // MediaQuery.of(context).size.width * 0.02,
                        ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Scaffold(
              body: Text("processed order"),
            ),
            Scaffold(
              body: Text("taken"),
            ),
          ],
        ),
      ),
    );
  }
}
