import 'dart:convert';

import 'package:tedikap_admin/app/data/model/statistic/analystic/month/month_model.dart';

StatisticResponseMonth statisticResponseMonthFromJson(String str) => StatisticResponseMonth.fromJson(json.decode(str));

String statisticResponseMonthToJson(StatisticResponseMonth data) => json.encode(data.toJson());

class StatisticResponseMonth {
    MonthData data;

    StatisticResponseMonth({
        required this.data,
    });

    factory StatisticResponseMonth.fromJson(Map<String, dynamic> json) => StatisticResponseMonth(
        data: MonthData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

