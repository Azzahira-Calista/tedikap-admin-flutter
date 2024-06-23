class ListProductResponse {
  List<Data>? data;

  ListProductResponse({this.data});

  ListProductResponse.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? description;
  int? regularPrice;
  int? largePrice;
  String? category;
  String? image;

  Data(
      {this.id,
        this.name,
        this.description,
        this.regularPrice,
        this.largePrice,
        this.category,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    regularPrice = json['regular_price'];
    largePrice = json['large_price'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['regular_price'] = this.regularPrice;
    data['large_price'] = this.largePrice;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
}