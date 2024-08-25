import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/common/themes.dart';

// ignore: must_be_immutable
class PanelFilter extends StatelessWidget {
  OrderController controller = Get.put(OrderController());
  PanelFilter({super.key, required this.statusType});

  final String statusType;

  @override
  Widget build(BuildContext context) {
    RxBool isCheckedSession1 = false.obs;
    RxBool isCheckedSession2 = false.obs;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: height * 0.3,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: offColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Session",
                      style: normalText.copyWith(fontSize: 15),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Session 1 (09.30 - 10.00)",
                            style: normalText,
                          ),
                          Checkbox(
                            value: isCheckedSession1.value,
                            tristate: true,
                            checkColor: primaryColor,
                            onChanged: (value) {
                              controller.toggleSession1(
                                  statusType, isCheckedSession1);
                            },
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Session 2 (12.00 - 10.30)",
                            style: normalText,
                          ),
                          Checkbox(
                            value: isCheckedSession2.value,
                            tristate: true,
                            checkColor: primaryColor,
                            onChanged: (value) {
                              controller.toggleSession2(
                                  statusType, isCheckedSession2);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       width: width * 0.42,
          //       child: myButton(
          //           text: 'Reset Filter',
          //           onPressed: controller.resetFilters,
          //           color: white,
          //           textColor: primaryTextColor),
          //     ),
          //     Container(
          //       width: width * 0.42,
          //       child: myButton(
          //           text: 'Save',
          //           onPressed: () {
          //             controller.saveSessionFilter();
          //             Get.back();
          //           },
          //           color: primaryColor,
          //           textColor: white),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
