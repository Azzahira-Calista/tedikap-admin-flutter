class Data {
    int id;
    String name;
    String description;
    int price;
    String category;
    String image;

    Data({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.category,
        required this.image,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "image": image,
    };
}
