import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_model.dart';

class YearData {
  Detail? january;
  Detail? february;
  Detail? march;
  Detail? april;
  Detail? may;
  Detail? june;
  Detail? july;
  Detail? august;
  Detail? september;
  Detail? october;
  Detail? november;
  Detail? december;

  YearData(
      {this.january,
      this.february,
      this.march,
      this.april,
      this.may,
      this.june,
      this.july,
      this.august,
      this.september,
      this.october,
      this.november,
      this.december});

  YearData.fromJson(Map<String, dynamic> json) {
    january =
        json['Detail'] != null ? new Detail.fromJson(json['Detail']) : null;
    february = json['February'] != null
        ? new Detail.fromJson(json['February'])
        : null;
    march = json['March'] != null ? new Detail.fromJson(json['March']) : null;
    april = json['April'] != null ? new Detail.fromJson(json['April']) : null;
    may = json['May'] != null ? new Detail.fromJson(json['May']) : null;
    june = json['June'] != null ? new Detail.fromJson(json['June']) : null;
    july = json['July'] != null ? new Detail.fromJson(json['July']) : null;
    august =
        json['August'] != null ? new Detail.fromJson(json['August']) : null;
    september = json['September'] != null
        ? new Detail.fromJson(json['September'])
        : null;
    october =
        json['October'] != null ? new Detail.fromJson(json['October']) : null;
    november = json['November'] != null
        ? new Detail.fromJson(json['November'])
        : null;
    december = json['December'] != null
        ? new Detail.fromJson(json['December'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.january != null) {
      data['Detail'] = this.january!.toJson();
    }
    if (this.february != null) {
      data['February'] = this.february!.toJson();
    }
    if (this.march != null) {
      data['March'] = this.march!.toJson();
    }
    if (this.april != null) {
      data['April'] = this.april!.toJson();
    }
    if (this.may != null) {
      data['May'] = this.may!.toJson();
    }
    if (this.june != null) {
      data['June'] = this.june!.toJson();
    }
    if (this.july != null) {
      data['July'] = this.july!.toJson();
    }
    if (this.august != null) {
      data['August'] = this.august!.toJson();
    }
    if (this.september != null) {
      data['September'] = this.september!.toJson();
    }
    if (this.october != null) {
      data['October'] = this.october!.toJson();
    }
    if (this.november != null) {
      data['November'] = this.november!.toJson();
    }
    if (this.december != null) {
      data['December'] = this.december!.toJson();
    }
    return data;
  }
}