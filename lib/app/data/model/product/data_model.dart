// ignore_for_file: non_constant_identifier_names

class Data {
  int id;
  String name;
  String description;
  int regular_price;
  int large_price;
  String category;
  String image;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.regular_price,
    required this.large_price,
    required this.category,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        regular_price: json["regular_price"] ?? 0,
        large_price: json["large_price"] ?? 0,
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "regular_price": regular_price,
        "large_price": large_price,
        "category": category,
        "image": image,
      };
}
