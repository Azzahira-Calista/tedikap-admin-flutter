class Detail {
  String? date;
  int? totalPcsSold;
  int? totalIncome;

  Detail({this.date, this.totalPcsSold, this.totalIncome});

  Detail.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalPcsSold = json['total_pcs_sold'];
    totalIncome = json['total_income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['total_pcs_sold'] = this.totalPcsSold;
    data['total_income'] = this.totalIncome;
    return data;
  }
}