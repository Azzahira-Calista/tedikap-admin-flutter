import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: offColor),
              ),
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
                        value: 'This Week',
                        child: Text('This Week'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'This Month',
                        child: Text('This Month'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'This Year',
                        child: Text('This Year'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.898,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: darkGrey),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GetX<HomeController>(
              builder: (controller) {
                List<salesData> data =
                    _getDataForRange(controller.selectedRange.value);

                return BarChart(
                  BarChartData(
                    // maxY: 100,
                    barGroups: _buildBarGroups(data),
                    titlesData: FlTitlesData(
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40, // Ensure enough space for labels
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  fontSize: 10, // Set font size here
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40, // Ensure enough space for labels
                          getTitlesWidget: (value, meta) {
                            final title = data[value.toInt()].x.toString();
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 10, // Set font size here
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      border: Border(
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups(List<salesData> data) {
    return data
        .asMap()
        .entries
        .map(
          (entry) => BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.y,
                color: primaryColor,
                width: 20,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
        )
        .toList();
  }

  List<salesData> _getDataForRange(String range) {
    switch (range) {
      case 'This Year':
        return [
          salesData('Jan', 10),
          salesData('Feb', 20),
          salesData('Mar', 30),
          salesData('Apr', 40),
          salesData('May', 50),
          salesData('Jun', 60),
          salesData('Jul', 70),
          salesData('Aug', 80),
          salesData('Sep', 90),
          salesData('Oct', 100),
          salesData('Nov', 110),
          salesData('Dec', 120),
        ];
      case 'This Week':
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
  final dynamic x;
  final double y;
}
