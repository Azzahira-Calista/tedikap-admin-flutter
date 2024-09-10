import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/analytics/bar_chart_widget.dart';
import 'package:tedikap_admin/common/themes.dart';

class BarChartContainer extends GetView<HomeController> {
  const BarChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(5),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: offColor),
                      ),
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down),
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
                        items: const [
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
          const SizedBox(height: 30),
          Stack(children: [
            AspectRatio(
                aspectRatio: 1.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: height,
                    width: controller.selectedRange.value == 'This Month'
                        ? width * 2
                        : width * 0.9,
                    child: Obx(
                      () {
                        return BarChart(BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: controller.selectedRange.value == 'This Week'
                                ? 210
                                : controller.selectedRange.value == 'This Year'
                                    ? 1010
                                    : 510,
                            gridData: const FlGridData(
                              show: false,
                            ),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 48,
                                  getTitlesWidget: (value, meta) {
                                    if (value == 0) {
                                      return Text('0 Pcs', style: smallText);
                                    }
                                    if (value == 100) {
                                      return Text('100 pcs', style: smallText);
                                    }
                                    if (value == 200) {
                                      return Text('200 pcs', style: smallText);
                                    }
                                    if (value == 300) {
                                      return Text('300 pcs', style: smallText);
                                    }
                                    if (value == 400) {
                                      return Text('400 pcs', style: smallText);
                                    }
                                    if (value == 500) {
                                      return Text('500 pcs', style: smallText);
                                    }
                                    if (value == 1000 && value == 1000) {
                                      return Text('1000 pcs', style: smallText);
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 42,
                                  getTitlesWidget: controller
                                              .selectedRange.value ==
                                          'This Week'
                                      ? BarChartWidgets().mingguanTitles
                                      : controller.selectedRange.value ==
                                              'This Month'
                                          ? BarChartWidgets().bulananTitles
                                          : controller.selectedRange.value ==
                                                  'This Year'
                                              ? BarChartWidgets().tahunanTitles
                                              : BarChartWidgets()
                                                  .mingguanTitles,
                                ),
                              ),
                              rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: controller.selectedRange.value ==
                                    'This Week'
                                ? controller.mingguanData
                                : controller.selectedRange.value == 'This Month'
                                    ? controller.bulananData
                                    : controller.selectedRange.value ==
                                            'This Year'
                                        ? controller.tahunanData
                                        : controller.mingguanData,
                            barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                              getTooltipColor: (_) =>
                                  lightGrey.withOpacity(0.9),
                              getTooltipItem:
                                  (group, groupIndex, rod, rodIndex) {
                                String totalSales =
                                    group.barRods[0].toY.toInt().toString();

                                return BarTooltipItem(
                                    '${controller.selectedRange.value == 'This Week' ? BarChartWidgets().getWeekDay(group.x.toDouble()) : controller.selectedRange.value == 'This Month' ? BarChartWidgets().getWeekNumber(group.x.toDouble()) : controller.selectedRange.value == 'This Year' ? BarChartWidgets().getMonth(group.x.toInt()) : ''}\n $totalSales Pcs',
                                    normalText);
                              },
                            ))));
                      },
                    ),
                  ),
                )),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: height * 0.31,
                color: backgroundColor,
                child: Obx(
                  () {
                    if (controller.selectedRange.value == 'This Week') {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('200 pcs', style: smallText),
                          Text('100 pcs', style: smallText),
                          Column(
                            children: [
                              Text('0 pcs', style: smallText),
                              SizedBox(
                                height: height * 0.02,
                              )
                            ],
                          ),
                        ],
                      );
                    } else if (controller.selectedRange.value == 'This Year') {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1000 pcs', style: smallText),
                          SizedBox(
                            height: height * 0.14,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('400 pcs', style: smallText),
                                Text('200 pcs', style: smallText),
                                Text('0 pcs', style: smallText),
                                SizedBox(
                                  height: height * 0.001,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('500 pcs', style: smallText),
                          Text('400 pcs', style: smallText),
                          Text('300 pcs', style: smallText),
                          Text('200 pcs', style: smallText),
                          Text('100 pcs', style: smallText),
                          Text('0 pcs', style: smallText),
                          SizedBox(
                            height: height * 0.001,
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
                bottom: height * 0.055,
                right: 0,
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Container(
                    height: height * 0.5,
                    width: 1,
                    color: primaryColor,
                  ),
                  Container(
                    height: 1,
                    width: width * 0.75,
                    color: primaryColor,
                  ),
                ]))
          ])
        ]));
  }
}
