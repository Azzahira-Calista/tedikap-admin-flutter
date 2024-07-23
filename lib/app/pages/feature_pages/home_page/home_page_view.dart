import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/appbar_home.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/check_order_button.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/summary.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/tab_analytics.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/tab_earnings.dart';
import 'package:tedikap_admin/common/themes.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
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
              title: AppBarHome(),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Column(
                  children: [
                    TabBar(
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
                            child: Text('Earnings'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
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
              panel: Container(
                width: screenWidth,
                // color: primaryColor,
                height: 40,
              ),

              header: Container(
                width: screenWidth,
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              defaultPanelState: PanelState.OPEN,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02),
              // minHeight: screenHeight * 0.4,
              minHeight: screenHeight * 0.2,
              maxHeight: screenHeight * 0.8,

              // initialPanelState: PanelState.OPEN, // Auto open to initial height
              // header: GestureDetector(
              //   onVerticalDragUpdate: (details) {
              //     // Implement drag functionality here if needed
              //   },
              body: TabBarView(
                children: [
                  EarningsTab(),
                  AnalyticsTab()
                  // SingleChildScrollView(
                  //   child: Container(
                  //     padding: EdgeInsets.all(20),
                  //     child: Column(
                  //       children: [
                  //         SizedBox(
                  //             height:
                  //                 MediaQuery.of(context).size.height * 0.02),
                  //         CheckOrderButton(),
                  //         SizedBox(
                  //             height:
                  //                 MediaQuery.of(context).size.height * 0.02),
                  //         SalesSummary(),
                  //         SizedBox(height: 20),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Center(child: Text('Content for Tab 2')),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
