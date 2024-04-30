import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tedikap_admin/controllers/home_controller.dart';
import 'package:tedikap_admin/themes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class HomePage extends StatelessWidget {
  final HomeController rangeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                Container(
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
                      InkWell(
                        onTap: () {
                          // Get.toNamed("/order");
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Manage order",
                              style: normalText,
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      )
                    ],
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
                            child: GetX<HomeController>(
                              builder: (controller) {
                                return DropdownButton<String>(
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      rangeController.changeRange(
                                          value); // Update controller value
                                    }
                                  },
                                  hint: Text(controller.selectedRange
                                      .value), // Dynamically update hint text
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
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 78,
                            width: 180,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Total orders", style: subTitle),
                                    SizedBox(width: 5),
                                    SvgPicture.asset(graficIcon, width: 15)
                                  ],
                                ),
                                Text("20", style: cardText),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: black)),
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(
                            text: "Inventory Data - Today",
                            textStyle: subTitle,
                          ),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ColumnSeries<salesData, double>>[
                            ColumnSeries<salesData, double>(
                              dataSource: <salesData>[
                                salesData(0, 10),
                                salesData(1, 20),
                                salesData(2, 30),
                                salesData(3, 40),
                                salesData(4, 50),
                                salesData(5, 60),
                              ],
                              xValueMapper: (salesData sales, _) =>
                                  sales.x.toDouble(),
                              yValueMapper: (salesData sales, _) => sales.y,
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
                )
              ],
            )));
  }
}

class salesData {
  salesData(this.x, this.y);
  final int x;
  final double y;
}
