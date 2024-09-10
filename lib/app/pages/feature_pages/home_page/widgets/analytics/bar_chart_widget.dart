import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
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
    final List<String> weekNumbers = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31'
    ];

    if (value >= 0 && value < weekNumbers.length) {
      return weekNumbers[value.toInt()];
    } else {
      throw Error();
    }
  }

  Widget mingguanTitles(double value, TitleMeta meta) {
    final List<String> weekdays = ['M', 'T', 'W', 'T', 'F', 'S'];

    if (value >= 0 && value < weekdays.length) {
      return Text(
        weekdays[value.toInt()],
        style: normalText,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget bulananTitles(double value, TitleMeta meta) {
    final List<String> days = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31'
    ];

    if (value >= 0 && value < days.length) {
      return Text(
        days[value.toInt()],
        style: normalText,
      );
    } else {
      return const SizedBox.shrink();
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
      return const SizedBox.shrink();
    }
  }
}
