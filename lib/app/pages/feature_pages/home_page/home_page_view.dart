import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/appbar_home.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/panel_order.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/tab_analytics.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/tab_earnings.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/common/themes.dart';

class HomePage extends GetView<HomeController> {
  final PanelController _panelController = PanelController();
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    // final earnings = controller.earningsResponseModel;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: AppBarHome(),
              foregroundColor: white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: normalText.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                      labelStyle: normalText.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: primaryColor, width: 1)),
                            child: Text('Earnings'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: primaryColor, width: 1)),
                            child: Text('Analytics'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: SlidingUpPanel(
              controller: _panelController,
              panel: PanelOrder(),
              header: Container(
                width: screenWidth,
                height: 30,
                // color: primaryColor,
                child: Center(
                  // alignment: Alignment.topCenter,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: offColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              defaultPanelState: PanelState.CLOSED,
              padding: EdgeInsets.only(
                top: screenHeight * 0.01,
              ),
              minHeight: screenHeight * 0.05,
              backdropOpacity: 0.5,
              backdropEnabled: false,
              panelSnapping: false,
              body: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () async {
                  orderController.getOrdersByStatusNew(null);
                  controller.isSwitched.value;
                },
                child: ListView(
                  children: [
                    Container(
                      height: screenHeight,
                      child: TabBarView(
                        children: [EarningsTab(), AnalyticsTab()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
