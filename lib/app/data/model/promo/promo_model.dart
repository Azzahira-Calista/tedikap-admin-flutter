class ListPromo {
  List<Data>? data;

  ListPromo({this.data});

  ListPromo.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  double? discount;
  int? maxDiscount;
  int? minTransaction;
  String? startDate;
  String? endDate;

  Data(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.discount,
        this.maxDiscount,
        this.minTransaction,
        this.startDate,
        this.endDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    discount = json['discount'];
    maxDiscount = json['max_discount'];
    minTransaction = json['min_transaction'];
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
    data['max_discount'] = this.maxDiscount;
    data['min_transaction'] = this.minTransaction;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
