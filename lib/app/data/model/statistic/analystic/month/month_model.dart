import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_model.dart';

class MonthData {
  Detail? Thursday;
  // Detail? minggu2;
  // Detail? minggu3;
  // Detail? minggu4;
  // Detail? minggu5;

  MonthData({this.Thursday, 
  // this.minggu2, this.minggu3, this.minggu4, this.minggu5
  });

  MonthData.fromJson(Map<String, dynamic> json) {
    Thursday =
        json['Thursday'] != null ? new Detail.fromJson(json['Thursday']) : null;
    // minggu2 =
    //     json['minggu2'] != null ? new Detail.fromJson(json['minggu2']) : null;
    // minggu3 =
    //     json['minggu3'] != null ? new Detail.fromJson(json['minggu3']) : null;
    // minggu4 =
    //     json['minggu4'] != null ? new Detail.fromJson(json['minggu4']) : null;
    // minggu5 =
    //     json['minggu5'] != null ? new Detail.fromJson(json['minggu5']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.Thursday != null) {
      data['Thursday'] = this.Thursday!.toJson();
    }
    // if (this.minggu2 != null) {
    //   data['minggu2'] = this.minggu2!.toJson();
    // }
    // if (this.minggu3 != null) {
    //   data['minggu3'] = this.minggu3!.toJson();
    // }
    // if (this.minggu4 != null) {
    //   data['minggu4'] = this.minggu4!.toJson();
    // }
    // if (this.minggu5 != null) {
    //   data['minggu5'] = this.minggu5!.toJson();
    // }
    return data;
  }
}