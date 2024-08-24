// class Detail {
//   int? totalPcsSold;
//   int? totalIncome;

//   Detail({this.totalPcsSold, this.totalIncome});

//   Detail.fromJson(Map<String, dynamic> json) {
//     totalPcsSold = json['total_pcs_sold'];
//     totalIncome = json['total_income'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total_pcs_sold'] = this.totalPcsSold;
//     data['total_income'] = this.totalIncome;
//     return data;
//   }
// }
class Detail {
    int? totalPcsSold;
    int? totalIncome;

    Detail({
        this.totalPcsSold,
        this.totalIncome,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        totalPcsSold: json["total_pcs_sold"],
        totalIncome: json["total_income"],
    );

    Map<String, dynamic> toJson() => {
        "total_pcs_sold": totalPcsSold,
        "total_income": totalIncome,
    };
}