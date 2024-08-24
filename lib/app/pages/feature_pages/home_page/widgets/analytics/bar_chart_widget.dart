import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tedikap_admin/common/themes.dart';

class BarChartWidgets {
  // BarTouchData getBarTouchData(bool isWeekly, RxInt touchedIndex) {
  //   return BarTouchData(
  //     touchTooltipData: BarTouchTooltipData(
  //       getTooltipColor: (_) => lightGrey.withOpacity(0.5),
  //       tooltipHorizontalAlignment: FLHorizontalAlignment.center,
  //       tooltipMargin: -10,
  //       getTooltipItem: (group, groupIndex, rod, rodIndex) {
  //         String weekDay =
  //             isWeekly ? getWeekDay(group.x) : getWeekNumber(group.x);
  //         return BarTooltipItem(
  //           '$weekDay\n',
  //           smallText,
  //           children: <TextSpan>[
  //             TextSpan(
  //               text: (rod.toY - 1).toString(),
  //               style: smallText,
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //     touchCallback: (FlTouchEvent event, barTouchResponse) {
  //       if (!event.isInterestedForInteractions ||
  //           barTouchResponse == null ||
  //           barTouchResponse.spot == null) {
  //         touchedIndex.value = -1;
  //         return;
  //       }
  //       touchedIndex.value = barTouchResponse.spot!.touchedBarGroupIndex;
  //     },
  //   );
  // }

  String getWeekDay(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Mondaay';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        throw Error();
    }
  }
  String getMonth(int value) {
    switch (value) {
      case 0:
        return 'January';
      case 1:
        return 'February';
      case 2:
        return 'March';
      case 3:
        return 'April';
      case 4:
        return 'May';
      case 5:
        return 'June';
      case 6:
        return 'July';
      case 7:
        return 'August';
      case 8:
        return 'September';
      case 9:
        return 'October';
      case 10:  
        return 'November';
      case 11:
        return 'December';
      default:
        throw Error();
    }
  }

  String getWeekNumber(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Week 1';
      // case 1:
      //   return 'Week 2';
      // case 2:
      //   return 'Week 3';
      // case 3:
      //   return 'Week 4';
      // case 4:
      //   return 'Week 5';
      default:
        throw Error();
    }
  }

  Widget mingguanTitles(double value, TitleMeta meta) {
    final List<String> weekdays = ['S', 'S', 'R', 'K', 'J', 'S', 'M'];

    if (value >= 0 && value < weekdays.length) {
      return Text(
        weekdays[value.toInt()],
        style: normalText,
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget bulananTitles(double value, TitleMeta meta) {
    final List<String> weeks = ['1', '2', '3', '4', '5'];

    if (value >= 0 && value < weeks.length) {
      return Text(
        weeks[value.toInt()],
        style: normalText,
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget tahunanTitles(double value, TitleMeta meta) {
    final List<String> months = [
      'J',
      'F',
      'M',
      'A',
      'M',
      'J',
      'J',
      'A',
      'S',
      'O',
      'N',
      'D'
    ];

    if (value >= 0 && value < months.length) {
      return Text(
        months[value.toInt()],
        style: normalText,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
