import 'dart:convert';

import 'package:tedikap_admin/app/data/model/statistic/analystic/month/month_model.dart';


StatisticResponseMonth statisticResponseMonthFromJson(String str) => StatisticResponseMonth.fromJson(json.decode(str));

String statisticResponseMonthToJson(StatisticResponseMonth data) => json.encode(data.toJson());

class StatisticResponseMonth {
    Map<String, MonthData>? data;
    int? product_sales;
    int? income;

    StatisticResponseMonth({
         this.data,
        this.product_sales,
        this.income,
    });

    factory StatisticResponseMonth.fromJson(Map<String, dynamic> json) => StatisticResponseMonth(
        data: Map.from(json["data"]).map((k, v) => MapEntry<String, MonthData>(k, MonthData.fromJson(v))),
        product_sales: json["product_sales"],
        income: json["income"],
    );

    Map<String, dynamic> toJson() => {
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "product_sales": product_sales,
        "income": income,
    };
}


