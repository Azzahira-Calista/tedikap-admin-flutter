// import 'package:tedikap_admin/app/data/model/statistic/analystic/month_model.dart';
// import 'package:tedikap_admin/app/data/model/statistic/analystic/week_model.dart';
// import 'package:tedikap_admin/app/data/model/statistic/analystic/year_model.dart';

// class StatisticResponseWeek {
//   WeekDataYear? WeekDataYear;
//   WeekDataWeek? WeekDataWeek;
//   WeekDataMonth? WeekDataMonth;

//   StatisticResponseWeek({this.WeekDataYear, this.WeekDataWeek, this.WeekDataMonth});

//   StatisticResponseWeek.fromJson(Map<String, dynamic> json) {
//     WeekDataYear = json['WeekDataYear'] != null ? WeekDataYear.fromJson(json['WeekDataYear']) : null;
//     WeekDataWeek = json['WeekDataWeek'] != null ? WeekDataWeek.fromJson(json['WeekDataWeek']) : null;
//     WeekDataMonth = json['WeekDataMonth'] != null ? WeekDataMonth.fromJson(json['WeekDataMonth']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     if (WeekDataYear != null) {
//       data['WeekDataYear'] = WeekDataYear!.toJson();
//     }
//     if (WeekDataWeek != null) {
//       data['WeekDataWeek'] = WeekDataWeek!.toJson();
//     }
//     if (WeekDataMonth != null) {
//       data['WeekDataMonth'] = WeekDataMonth!.toJson();
//     }
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final StatisticResponseWeek = StatisticResponseWeekFromJson(jsonString);

import 'dart:convert';

import 'package:tedikap_admin/app/data/model/statistic/analystic/week/week_model.dart';

StatisticResponseWeek statisticResponseWeekFromJson(String str) => StatisticResponseWeek.fromJson(json.decode(str));

String statisticResponseWeekToJson(StatisticResponseWeek data) => json.encode(data.toJson());

class StatisticResponseWeek {
    WeekData data;

    StatisticResponseWeek({
        required this.data,
    });

    factory StatisticResponseWeek.fromJson(Map<String, dynamic> json) => StatisticResponseWeek(
        data: WeekData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

