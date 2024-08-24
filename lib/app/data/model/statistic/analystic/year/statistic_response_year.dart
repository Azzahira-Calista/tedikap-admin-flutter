import 'dart:convert';

import 'package:tedikap_admin/app/data/model/statistic/analystic/year/year_model.dart';

StatisticResponseYear statisticResponseYearFromJson(String str) => StatisticResponseYear.fromJson(json.decode(str));

String statisticResponseYearToJson(StatisticResponseYear data) => json.encode(data.toJson());

class StatisticResponseYear {
    YearData data;

    StatisticResponseYear({
        required this.data,
    });

    factory StatisticResponseYear.fromJson(Map<String, dynamic> json) => StatisticResponseYear(
        data: YearData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

