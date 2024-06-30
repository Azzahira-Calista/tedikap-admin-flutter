// class ListPromo {
//   List<Data>? data;

//   ListPromo({this.data});

  // ListPromo.fromJson(Map<String, dynamic> json) {
  //   if (json['data'] != null) {
  //     data = <Data>[];
  //     json['data'].forEach((v) {
  //       data!.add(new Data.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
// }


import '../data_helper.dart';

class Data {
  int id;
  String title;
  String description;
  String image;
  double discount;
  // int? maxDiscount;
  int min_transaction;
  String start_date;
  String end_date;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.discount,
    // this.maxDiscount,
    required this.min_transaction,
    required this.start_date,
    required this.end_date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        discount: DataHelper.parseDouble(json['discount']) ?? 0.0,
        // maxDiscount: DataHelper.parseInt(json['max_discount']),
        min_transaction: json['min_transaction'],
        start_date: json['start_date'],
        end_date: json['end_date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'discount': discount,
        // 'max_discount': maxDiscount,
        'min_transaction': min_transaction,
        'start_date': start_date,
        'end_date': end_date,
      };
}
