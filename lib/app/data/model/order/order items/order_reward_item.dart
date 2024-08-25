  class OrderRewardItems {
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
    int? points;
    int? totalPoints;

    OrderRewardItems(
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
        this.points,
        this.totalPoints});

    OrderRewardItems.fromJson(Map<String, dynamic> json) {
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
      points = json['points'];
      totalPoints = json['total_points'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = id;
      data['product_id'] = productId;
      data['product_name'] = productName;
      data['item_type'] = itemType;
      data['temperatur'] = temperatur;
      data['size'] = size;
      data['ice'] = ice;
      data['sugar'] = sugar;
      data['note'] = note;
      data['quantity'] = quantity;
      data['points'] = points;
      data['total_points'] = totalPoints;
      return data;
    }
  }