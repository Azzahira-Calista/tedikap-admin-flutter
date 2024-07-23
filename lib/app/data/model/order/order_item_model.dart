
class OrderItems {
  int? id;
  int? productId;
  String? productName;
  String? itemType;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  String? note;
  int? quantity;
  int? price;

  OrderItems(
      {this.id,
      this.productId,
      this.productName,
      this.itemType,
      this.temperatur,
      this.size,
      this.ice,
      this.sugar,
      this.note,
      this.quantity,
      this.price});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    itemType = json['item_type'];
    temperatur = json['temperatur'];
    size = json['size'];
    ice = json['ice'];
    sugar = json['sugar'];
    note = json['note'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['item_type'] = this.itemType;
    data['temperatur'] = this.temperatur;
    data['size'] = this.size;
    data['ice'] = this.ice;
    data['sugar'] = this.sugar;
    data['note'] = this.note;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}
