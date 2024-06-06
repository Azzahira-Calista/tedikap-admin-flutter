import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/sales_grafic.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';
import '../home_controller.dart';

class SalesSummary extends GetView<HomeController> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tedikap summary", style: subTitle),
              Container(
                padding: EdgeInsets.all(5),
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: offColor)),
                child: GetX<HomeController>(
                  builder: (controller) {
                    return DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 15,
                      style: smallText,
                      onChanged: (String? value) {
                        if (value != null) {
                          controller.changeRange(value);
                        }
                      },
                      hint: Text(
                        controller.selectedRange.value,
                        style: smallText,
                      ),
                      underline: Container(),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Today',
                          child: Text('Today'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'This Week',
                          child: Text('This Week'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'This Month',
                          child: Text('This Month'),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 78,
                    width: MediaQuery.sizeOf(context).width * 0.405,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Total orders", style: cardTitle),
                            SizedBox(width: 5),
                            SvgPicture.asset(graficIcon, width: 15)
                          ],
                        ),
                        Text("20", style: cardText),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROMO_VIEW);
                    },
                    child: Container(
                      height: 78,
                      width: MediaQuery.sizeOf(context).width * 0.405,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Voucher", style: cardTitle),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                coupon,
                                width: 20,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("20", style: cardText),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 78,
                    width: MediaQuery.sizeOf(context).width * 0.405,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Products", style: cardTitle),
                            SizedBox(width: 5),
                            SvgPicture.asset(
                              drinkIcon,
                              width: 15,
                              color: primaryColor,
                            )
                          ],
                        ),
                        Text("125", style: cardText),
                      ],
                    ),
                  ),
                  Container(
                    height: 78,
                    width: MediaQuery.sizeOf(context).width * 0.405,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Total sales", style: cardTitle),
                            SizedBox(width: 5),
                            SvgPicture.asset(moneyIcon, width: 15)
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "RP.",
                              style: cardText,
                            ),
                            Text("450.000", style: cardText),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SalesGrafic()
        ],
      ),
    );
  }
}
