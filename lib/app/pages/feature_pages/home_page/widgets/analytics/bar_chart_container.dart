import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/analytics/bar_chart_widget.dart';
import 'package:tedikap_admin/common/themes.dart';

class BarChartContainer extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: lightGrey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Obx(
            () {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Summary ${controller.selectedRange.value}',
                      style: subTitle),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: offColor),
                      ),
                      child: DropdownButton<String>(
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
                      ))
                ],
              );
            },
          ),
          SizedBox(height: 10),
          SizedBox(height: 30),
          AspectRatio(
              aspectRatio: 1.3,
              child: Obx(
                () {
                  return BarChart(BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: controller.selectedRange.value == 'This Week'
                          ? 200
                          : controller.selectedRange.value == 'This Year'
                              ? 1000
                              : 500,
                      gridData: FlGridData(
                        show: false,
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 48,
                            getTitlesWidget: (value, meta) {
                              if (value == 0)
                                return Text('0 Pcs', style: smallText);
                              if (value == 100)
                                return Text('100 pcs', style: smallText);
                              if (value == 200)
                                return Text('200 pcs', style: smallText);
                              if (value == 300)
                                return Text('300 pcs', style: smallText);
                              if (value == 400)
                                return Text('400 pcs', style: smallText);
                              if (value == 500)
                                return Text('500 pcs', style: smallText);
                              if (value == 1000 && value == 1000)
                                return Text('1000 pcs', style: smallText);
                              return SizedBox.shrink();
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 42,
                            getTitlesWidget: controller.selectedRange.value ==
                                    'This Week'
                                ? BarChartWidgets().mingguanTitles
                                : controller.selectedRange.value == 'This Month'
                                    ? BarChartWidgets().bulananTitles
                                    : controller.selectedRange.value ==
                                            'This Year'
                                        ? BarChartWidgets().tahunanTitles
                                        : BarChartWidgets().mingguanTitles,
                          ),
                        ),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: controller.selectedRange.value == 'This Week'
                          ? controller.mingguanData
                          : controller.selectedRange.value == 'This Month'
                              ? controller.bulananData
                              : controller.selectedRange.value == 'This Year'
                                  ? controller.tahunanData
                                  : controller.mingguanData,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (_) => lightGrey.withOpacity(0.9),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          String totalSales =
                              group.barRods[0].toY.toInt().toString();

                          return BarTooltipItem(
                              '${controller.selectedRange.value == 'This Week' ? BarChartWidgets().getWeekDay(group.x.toDouble()) : controller.selectedRange.value == 'This Month' ? BarChartWidgets().getWeekNumber(group.x.toDouble()) : controller.selectedRange.value == 'This Year' ? BarChartWidgets().getMonth(group.x.toInt()) : ''}\n ${totalSales} Pcs',
                              normalText);
                        },
                      ))));
                },
              ))
        ]));
  }
}
