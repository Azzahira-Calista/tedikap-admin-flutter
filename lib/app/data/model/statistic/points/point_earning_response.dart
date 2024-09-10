class PointEarningResponse {
  Points? data;

  PointEarningResponse({this.data});

  PointEarningResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Points.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Points {
  int? totalPointsUsed;
  int? totalMoneyEquivalent;

  Points({this.totalPointsUsed, this.totalMoneyEquivalent});

  Points.fromJson(Map<String, dynamic> json) {
    totalPointsUsed = json['total_points_used'];
    totalMoneyEquivalent = json['total_money_equivalent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_points_used'] = this.totalPointsUsed;
    data['total_money_equivalent'] = this.totalMoneyEquivalent;
    return data;
  }
}