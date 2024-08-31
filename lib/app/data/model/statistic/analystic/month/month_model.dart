class MonthData {
  DateTime? date;
  int? totalPcsSold;
  int? totalIncome;

  MonthData({
    this.date,
    this.totalPcsSold,
    this.totalIncome,
  });

  factory MonthData.fromJson(Map<String, dynamic> json) => MonthData(
    date: DateTime.parse(json["date"]),
    totalPcsSold: json["total_pcs_sold"],
    totalIncome: json["total_income"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "total_pcs_sold": totalPcsSold,
    "total_income": totalIncome,
  };
}