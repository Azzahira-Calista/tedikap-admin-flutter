import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/analytics/bar_chart_container.dart';
import 'package:tedikap_admin/common/format.dart';

import '../../../../../common/themes.dart';

class AnalyticsTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        children: [
          BarChartContainer(),
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Income Container
                Container(
                  width: screenWidth * 0.44,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Income",
                        style: normalText.copyWith(color: darkGrey),
                      ),
                      Obx(() {
                        final income = (controller.selectedRange.value ==
                                'This Week')
                            ? controller.statisticResponseWeek?.income
                            : (controller.selectedRange.value == 'This Month')
                                ? controller.statisticResponseMonth?.income
                                : (controller.selectedRange.value ==
                                        'This Year')
                                    ? controller.statisticResponseYear?.income
                                    : controller.statisticResponseWeek?.income;

                        return Text(
                          formatRupiah(income ?? 0),
                          style:
                              cardText.copyWith(fontSize: 20, color: darkGrey),
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * 0.44,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Product Sales",
                        style: normalText.copyWith(color: darkGrey),
                      ),
                      Obx(() {
                        final productSales = (controller.selectedRange.value ==
                                'This Week')
                            ? controller.statisticResponseWeek?.product_sales
                            : (controller.selectedRange.value == 'This Month')
                                ? controller
                                    .statisticResponseMonth?.product_sales
                                : (controller.selectedRange.value ==
                                        'This Year')
                                    ? controller
                                        .statisticResponseYear?.product_sales
                                    : controller
                                        .statisticResponseWeek?.product_sales;

                        return Text(
                          '${productSales ?? 0} Pcs',
                          style:
                              cardText.copyWith(fontSize: 20, color: darkGrey),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
