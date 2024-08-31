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

