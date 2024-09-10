import '../data_helper.dart';

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  int? discount;
  int? minTransaction;
  int? maxDiscount;
  String? startDate;
  String? endDate;

  Data(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.discount,
      this.minTransaction,
      this.maxDiscount,
      this.startDate,
      this.endDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    discount = json['discount'];
    minTransaction = json['min_transaction'];
    maxDiscount = json['max_discount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['discount'] = this.discount;
    data['min_transaction'] = this.minTransaction;
    data['max_discount'] = this.maxDiscount;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}