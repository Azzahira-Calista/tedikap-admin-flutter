// import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_model.dart';

// class DataWeek {
//   Detail? monday;
//   Detail? tuesday;
//   Detail? wednesday;
//   Detail? thursday;
//   Detail? friday;
//   Detail? saturday;
//   Detail? sunday;

//   DataWeek(
//       {this.monday,
//       this.tuesday,
//       this.wednesday,
//       this.thursday,
//       this.friday,
//       this.saturday,
//       this.sunday});

//   DataWeek.fromJson(Map<String, dynamic> json) {
//     monday =
//         json['Detail'] != null ? new Detail.fromJson(json['Detail']) : null;
//     tuesday =
//         json['Tuesday'] != null ? new Detail.fromJson(json['Tuesday']) : null;
//     wednesday = json['Wednesday'] != null
//         ? new Detail.fromJson(json['Wednesday'])
//         : null;
//     thursday =
//         json['Thursday'] != null ? new Detail.fromJson(json['Thursday']) : null;
//     friday =
//         json['Friday'] != null ? new Detail.fromJson(json['Friday']) : null;
//     saturday =
//         json['Saturday'] != null ? new Detail.fromJson(json['Saturday']) : null;
//     sunday =
//         json['Sunday'] != null ? new Detail.fromJson(json['Sunday']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.monday != null) {
//       data['Detail'] = this.monday!.toJson();
//     }
//     if (this.tuesday != null) {
//       data['Tuesday'] = this.tuesday!.toJson();
//     }
//     if (this.wednesday != null) {
//       data['Wednesday'] = this.wednesday!.toJson();
//     }
//     if (this.thursday != null) {
//       data['Thursday'] = this.thursday!.toJson();
//     }
//     if (this.friday != null) {
//       data['Friday'] = this.friday!.toJson();
//     }
//     if (this.saturday != null) {
//       data['Saturday'] = this.saturday!.toJson();
//     }
//     if (this.sunday != null) {
//       data['Sunday'] = this.sunday!.toJson();
//     }
//     return data;
//   }
// }


import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_model.dart';

class WeekData {
    Detail? monday;
    Detail? tuesday;
    Detail? wednesday;
    Detail? thursday;
    Detail? friday;
    Detail? saturday;
    Detail? sunday;

    WeekData({
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday,
    });

    factory WeekData.fromJson(Map<String, dynamic> json) => WeekData(
        monday: Detail.fromJson(json["Monday"]),
        tuesday: Detail.fromJson(json["Tuesday"]),
        wednesday: Detail.fromJson(json["Wednesday"]),
        thursday: Detail.fromJson(json["Thursday"]),
        friday: Detail.fromJson(json["Friday"]),
        saturday: Detail.fromJson(json["Saturday"]),
        sunday: Detail.fromJson(json["Sunday"]),
    );

    Map<String, dynamic> toJson() => {
        "Monday": monday?.toJson() ,
        "Tuesday": tuesday?.toJson(),
        "Wednesday": wednesday?.toJson(),
        "Thursday": thursday?.toJson(),
        "Friday": friday?.toJson(),
        "Saturday": saturday?.toJson(),
        "Sunday": sunday?.toJson(),
    };
}

