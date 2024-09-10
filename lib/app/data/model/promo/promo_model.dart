class Promo {
  int? id;
  String? title;
  String? description;
  int? discount;
  String? startDate;
  String? endDate;
  List<Products>? products;

  Promo(
      {this.id,
        this.title,
        this.description,
        this.discount,
        this.startDate,
        this.endDate,
        this.products});

  Promo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    discount = json['discount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? regularPrice;
  int? largePrice;
  String? category;
  String? image;
  bool? isLiked;
  int? favoritesCount;
  bool? stock;

  Products(
      {this.id,
        this.name,
        this.description,
        this.regularPrice,
        this.largePrice,
        this.category,
        this.image,
        this.isLiked,
        this.favoritesCount,
        this.stock});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    regularPrice = json['regular_price'];
    largePrice = json['large_price'];
    category = json['category'];
    image = json['image'];
    isLiked = json['isLiked'];
    favoritesCount = json['favorites_count'];
    stock = json['stock'];
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
    data['isLiked'] = this.isLiked;
    data['favorites_count'] = this.favoritesCount;
    data['stock'] = this.stock;
    return data;
  }
}
