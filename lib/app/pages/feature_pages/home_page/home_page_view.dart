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

  final RxBool isRefreshing = false.obs;

  HomePage({super.key});

  Future<void> _refreshData() async {
    try {
      isRefreshing.value = true; 
      await controller.getEarningsData();
      await orderController.getOrdersByStatusNew(null);
      await controller.getStatusStore();
    } finally {
      isRefreshing.value = false; 
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double dpi = MediaQuery.of(context).devicePixelRatio * 180.0;

    print('Screen DPI: $dpi');

    return GetBuilder<HomeController>(
      init: controller,
      builder: (controller){
        return Obx(() {
          if (controller.isLoading.value && !isRefreshing.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return DefaultTabController(
              length: 2,
              child: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: _refreshData,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const AppBarHome(),
                    foregroundColor: white,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(70),
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
                                      border: Border.all(
                                          color: primaryColor, width: 1)),
                                  child: const Text('Earnings'),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: primaryColor, width: 1)),
                                  child: const Text('Analytics'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: SlidingUpPanel(
                    color: backgroundColor,
                    controller: _panelController,
                    panel: PanelOrder(),
                    header: SizedBox(
                      width: screenWidth,
                      height: 30,
                      child: Center(
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
                    borderRadius: const BorderRadius.only(
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
                    body: ListView(
                      children: [
                        SizedBox(
                          height: screenHeight,
                          child: TabBarView(
                            children: [
                              EarningsTab(),
                              AnalyticsTab()],
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
    );
  }
}
