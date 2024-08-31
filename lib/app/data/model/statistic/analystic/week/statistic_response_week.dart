import 'dart:convert';

import 'package:tedikap_admin/app/data/model/statistic/analystic/week/week_model.dart';

StatisticResponseWeek statisticResponseWeekFromJson(String str) => StatisticResponseWeek.fromJson(json.decode(str));

String statisticResponseWeekToJson(StatisticResponseWeek data) => json.encode(data.toJson());

class StatisticResponseWeek {
    WeekData? data;
    int? product_sales;
    int? income;

    StatisticResponseWeek({this.data, this.product_sales, this.income});

    StatisticResponseWeek.fromJson(Map<String, dynamic> json) {
        data = json['data'] != null ? new WeekData.fromJson(json['data']) : null;
        product_sales = json['product_sales'];
        income = json['income'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data!.toJson();
        }
        data['product_sales'] = this.product_sales;
        data['income'] = this.income;
        return data;
    }
}
