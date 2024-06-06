// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

class Data {
  int id;
  String title;
  String description;
  String image;
  double discount;
  int max_discount;
  int min_transaction;
  String start_date;
  String end_date;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.discount,
    required this.max_discount,
    required this.min_transaction,
    required this.start_date,
    required this.end_date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        discount: json["discount"] ?? 0,
        max_discount: json["max_discount"] ?? 0,
        min_transaction: json["min_transaction"] ?? 0,
        start_date: json["start_date"],
        end_date: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "discount": discount,
        "max_discount": max_discount,
        "min_transaction": min_transaction,
        "start_date": start_date,
        "end_date": end_date,
      };
}
