import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/widget/date_picker.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/common/themes.dart';

// ignore: must_be_immutable
class PanelFilter extends StatelessWidget {
  OrderController controller = Get.put(OrderController());
  // const PanelFilter({super.key});

  @override
  Widget build(BuildContext context) {
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
      height: height * 0.4,
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
                      "Sesi pesanan",
                      style: normalText.copyWith(fontSize: 15),
                    ),
                    GestureDetector(
                    onTap: controller.toggleSession1,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sesi 1 (09.30 - 10.00)",
                              style: normalText,
                            ),
                            Checkbox(
                            value: controller.isCheckedSession1.value,
                              tristate: true,
                              checkColor: primaryColor,
                              onChanged: (value) {
                                controller.isCheckedSession1.toggle();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                    onTap: controller.toggleSession2,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sesi 2 (12.0 - 10.45)",
                              style: normalText,
                            ),
                            Checkbox(
                            value: controller.isCheckedSession2.value,
                              tristate: true,
                              checkColor: primaryColor,
                              onChanged: (value) {
                                controller.isCheckedSession2.toggle();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //   Divider(
                //     color: lightGrey,
                //     thickness: 2,
                //   ),
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Periode pesanan",
                //         style: normalText.copyWith(fontSize: 15),
                //       ),
                //       SizedBox(
                //         height: height * 0.02,
                //       ),
                //       Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             DatePickerWidget(
                //               text: "Start date",
                //               controllers: controller.startDateController,
                //               onTap: () => controller.selectDate(
                //                   context, controller.startDateController),
                //             ),
                //             SizedBox(
                //                 width: 30,
                //                 height: 2,
                //                 child: Divider(color: lightGrey)),
                //             DatePickerWidget(
                //               text: "End date",
                //               controllers: controller.endDateController,
                //               onTap: () => controller.selectDate(
                //                   context, controller.endDateController),
                //             ),
                //           ]),
                //     ],
                //   ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.42,
                child: myButton(
                    text: 'Reset Filter',
                                      onPressed: controller.resetFilters,

                    color: white,
                    textColor: primaryTextColor),
              ),
              Container(
                width: width * 0.42,
                child: myButton(
                    text: 'Save',
                    onPressed: () {
                            controller.saveSessionFilter();
                            Get.back(); 
                    },
                    color: primaryColor,
                    textColor: white),
              )
            ],
          )
        ],
      ),
    );
  }
}
