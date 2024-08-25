class StatusStockRewardResponse {
  String? message;
  Danum? data;

  StatusStockRewardResponse({this.message, this.data});

  StatusStockRewardResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Danum.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Danum {
  int? id;
  String? name;
  String? description;
  String? image;
  int? regularPoint;
  int? largePoint;
  String? category;
  bool? stock;
  String? createdAt;
  String? updatedAt;

  Danum(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.regularPoint,
      this.largePoint,
      this.category,
      this.stock,
      this.createdAt,
      this.updatedAt});

  Danum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    regularPoint = json['regular_point'];
    largePoint = json['large_point'];
    category = json['category'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['regular_point'] = this.regularPoint;
    data['large_point'] = this.largePoint;
    data['category'] = this.category;
    data['stock'] = this.stock;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
