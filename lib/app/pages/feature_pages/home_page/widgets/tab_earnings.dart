import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/common/format.dart';
import 'package:tedikap_admin/common/themes.dart';

class EarningsTab extends GetView<HomeController> {
  const EarningsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: screenWidth,
              height: screenHeight * 0.1,
              decoration: BoxDecoration(
                color: controller.isSwitched == true
                    ? cream
                    : const Color.fromARGB(255, 252, 205, 205),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.storefront_outlined,
                          color: controller.isSwitched == true
                              ? primaryColor
                              : red),
                      const SizedBox(width: 10),
                      Text(
                          'Store is ${controller.isSwitched == true ? 'open' : 'closed'}',
                          style: cardText.copyWith(
                              color: controller.isSwitched == true
                                  ? primaryColor
                                  : red)),
                    ],
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: white,
                                backgroundColor: primaryColor,
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : Switch(
                            activeColor: primaryColor,
                            inactiveThumbColor: offColor,
                            trackOutlineColor:
                                MaterialStateProperty.all(Colors.white),
                            value: controller.isSwitched.value,
                            onChanged: (value) {
                              controller.toggeStoreStatus(value);
                            },
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.25,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Sales (Monthly)',
                    style: subTitle,
                  ),
                  Text(
                    formatRupiah(
                        controller.earningsResponseModel.value.totalSales ?? 0),
                    style: headline,
                  )
                ],
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.1,
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        Text("Avg Per Week",
                            style: normalText.copyWith(color: darkGrey)),
                        Text(
                            formatRupiah(controller.earningsResponseModel.value
                                    .averagePerWeek ??
                                0),
                            style: cardText.copyWith(
                                fontSize: 20, color: darkGrey)),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: screenWidth * 0.44,
                  //   height: screenHeight * 0.1,
                  //   decoration: BoxDecoration(
                  //     color: lightGrey,
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text("Earnings Growth",
                  //           style: normalText.copyWith(color: darkGrey)),
                  //       Text(
                  //           '${controller.earningsResponseModel.value.earningGrowth?.toString() ?? 0.toString()}%',
                  //           style: cardText.copyWith(
                  //               fontSize: 20, color: darkGrey)),
                  //     ],
                  //   ),
                  // ),
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
                        Text("Avg Points Per Week",
                            style: normalText.copyWith(color: darkGrey)),
                        Text(
                            '${controller.pointEarningResponseModel.value.totalPointsUsed ?? '0'} Pts',
                            style: cardText.copyWith(
                                fontSize: 20, color: darkGrey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
