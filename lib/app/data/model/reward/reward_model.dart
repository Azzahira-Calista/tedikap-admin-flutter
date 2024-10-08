class Data {
  int? id;
  String? name;
  String? description;
  int? regularPoint;
  int? largePoint;
  String? category;
  String? image;
  bool? stock;

  Data(
      {this.id,
      this.name,
      this.description,
      this.regularPoint,
      this.largePoint,
      this.category,
      this.image,
      this.stock});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    regularPoint = json['regular_point'];
    largePoint = json['large_point'];
    category = json['category'];
    image = json['image'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['regular_point'] = this.regularPoint;
    data['large_point'] = this.largePoint;
    data['category'] = this.category;
    data['image'] = this.image;
    data['stock'] = this.stock;
    return data;
  }
}