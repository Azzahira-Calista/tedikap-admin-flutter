import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../common/themes.dart';
import '../home_controller.dart';

class SalesGrafic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Summary',
              style: subTitle,
            ),
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
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Container(
            height: MediaQuery.sizeOf(context).height * 0.35,
            width: MediaQuery.sizeOf(context).width * 0.898,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: darkGrey)),
            child: GetX<HomeController>(
              builder: (controller) {
                List<salesData> data =
                    _getDataForRange(controller.selectedRange.value);

                return SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ColumnSeries<salesData, dynamic>>[
                    ColumnSeries<salesData, dynamic>(
                      dataSource: data,
                      xValueMapper: (salesData sales, _) => sales.x,
                      yValueMapper: (salesData sales, _) => sales.y,
                      name: "Inventory",
                      color: primaryColor,
                      // dataLabelSettings: DataLabelSettings(
                      //     isVisible: true,
                      //     labelAlignment:
                      //         ChartDataLabelAlignment.top)
                    ),
                  ],
                );
              },
            )),
      ],
    );
  }

  List<salesData> _getDataForRange(String range) {
    switch (range) {
      case 'Today':
        // Hourly data
        return [
          salesData('00:00', 10),
          salesData('01:00', 20),
          salesData('02:00', 30),
          salesData('03:00', 40),
          salesData('04:00', 50),
          salesData('05:00', 60),
          salesData('06:00', 50),
          salesData('07:00', 70),
        ];
      case 'This Week':
        // Daily data
        return [
          salesData('Mon', 10),
          salesData('Tue', 20),
          salesData('Wed', 30),
          salesData('Thu', 40),
          salesData('Fri', 50),
          salesData('Sat', 60),
          salesData('Sun', 70),
        ];
      case 'This Month':
        // Weekly data
        return [
          salesData('Week 1', 70),
          salesData('Week 2', 60),
          salesData('Week 3', 50),
          salesData('Week 4', 40),
        ];
      default:
        return [];
    }
  }
}

class salesData {
  salesData(this.x, this.y);
  final dynamic x; // Changed to dynamic to support different x value types
  final double y;
}
