import 'package:tedikap_admin/app/data/model/statistic/earnings/earnings_model.dart';

class EarningsResponse {
  EarningsData? data;

  EarningsResponse({this.data});

  EarningsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new EarningsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

