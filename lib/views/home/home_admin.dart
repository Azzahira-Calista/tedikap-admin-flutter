import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tedikap_admin/controllers/home_controller.dart';
import 'package:tedikap_admin/themes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tedikap_admin/widgets/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  final HomeController rangeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            logoTedikap,
                            width: 55,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          Text(
                            "Selamat datang, Admin",
                            style: appBarText,
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            // Get.toNamed("/login");
                          },
                          child: SvgPicture.asset(
                            notifIcon,
                            width: 36,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                InkWell(
                  onTap: () => (),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    height: 64,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: cream),
                              child: Stack(children: [
                                SvgPicture.asset(
                                  orderIcon,
                                  width: 25,
                                  height: 25,
                                ),
                                Positioned(
                                  right: 0,
                                  top: -4,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: red),
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.02,
                            ),
                            Text(
                              "New orders",
                              style: appBarText,
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Manage order",
                              style: normalText,
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                Container(
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
                                      rangeController.changeRange(value);
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                onTap: () => (),
                                child: Container(
                                  height: 78,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.405,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Ulasan", style: cardTitle),
                                          SizedBox(width: 5),
                                          Icon(
                                            Icons.star_rounded,
                                            color: primaryColor,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                                width: MediaQuery.sizeOf(context).width * 0.898,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: black)),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  title: ChartTitle(
                                    text: "Inventory Data - Today",
                                    textStyle: subTitle,
                                  ),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <ColumnSeries<salesData, double>>[
                                    ColumnSeries<salesData, double>(
                                      dataSource: <salesData>[
                                        salesData(0, 10),
                                        salesData(1, 20),
                                        salesData(2, 30),
                                        salesData(3, 40),
                                        salesData(4, 50),
                                        salesData(5, 60),
                                        salesData(6, 50),
                                        salesData(7, 70),
                                      ],
                                      xValueMapper: (salesData sales, _) =>
                                          sales.x.toDouble(),
                                      yValueMapper: (salesData sales, _) =>
                                          sales.y,
                                      name: "Inventory",
                                      color: primaryColor,
                                      // dataLabelSettings: DataLabelSettings(
                                      //     isVisible: true,
                                      //     labelAlignment:
                                      //         ChartDataLabelAlignment.top)
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => (),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    height: 64,
                    width: MediaQuery.sizeOf(context).width,
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
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              coupon,
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Tedikap voucher")
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: primaryColor),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
      // bottomNavigationBar: MyNavBar()
    );
  }
}

class salesData {
  salesData(this.x, this.y);
  final int x;
  final double y;
}
