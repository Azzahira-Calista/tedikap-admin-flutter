
class EarningsData {
  int? totalSales;
  num? averagePerWeek;
  int? earningGrowth;

  EarningsData({this.totalSales, this.averagePerWeek, this.earningGrowth});

  EarningsData.fromJson(Map<String, dynamic> json) {
    totalSales = json['total_sales'];
    averagePerWeek = json['average_per_week'];
    earningGrowth = json['earning_growth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_sales'] = this.totalSales;
    data['average_per_week'] = this.averagePerWeek;
    data['earning_growth'] = this.earningGrowth;
    return data;
  }
}