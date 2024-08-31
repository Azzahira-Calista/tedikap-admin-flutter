import 'dart:convert';

import 'package:tedikap_admin/app/data/model/statistic/analystic/year/year_model.dart';

StatisticResponseYear statisticResponseYearFromJson(String str) => StatisticResponseYear.fromJson(json.decode(str));

String statisticResponseYearToJson(StatisticResponseYear data) => json.encode(data.toJson());

class StatisticResponseYear {
    YearData? data;
    int? product_sales;
    int? income;

    StatisticResponseYear({this.data, this.product_sales, this.income});

    StatisticResponseYear.fromJson(Map<String, dynamic> json) {
        data = json['data'] != null ? new YearData.fromJson(json['data']) : null;
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
