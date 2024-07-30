// // ignore_for_file: unnecessary_this

// abstract class OrderItemBase {
//   int? get quantity;
//   Map<String, dynamic> toJson();
// }

// class OrderItems implements OrderItemBase {
//   int? id;
//   int? productId;
//   String? productName;
//   String? itemType;
//   String? temperatur;
//   String? size;
//   String? ice;
//   String? sugar;
//   String? note;
//   int? quantity;
//   int? price;
//   int? totalPrice;

//   OrderItems({
//     this.id,
//     this.productId,
//     this.productName,
//     this.itemType,
//     this.temperatur,
//     this.size,
//     this.ice,
//     this.sugar,
//     this.note,
//     this.quantity,
//     this.price,
//     this.totalPrice,
//   });

//   OrderItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     productName = json['product_name'];
//     itemType = json['item_type'];
//     temperatur = json['temperatur'];
//     size = json['size'];
//     ice = json['ice'];
//     sugar = json['sugar'];
//     note = json['note'];
//     quantity = json['quantity'];
//     price = json['price'];
//     totalPrice = json['total_price'];
//   }

//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['product_name'] = this.productName;
//     data['item_type'] = this.itemType;
//     data['temperatur'] = this.temperatur;
//     data['size'] = this.size;
//     data['ice'] = this.ice;
//     data['sugar'] = this.sugar;
//     data['note'] = this.note;
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     data['total_price'] = this.totalPrice;
//     return data;
//   }
// }

// class OrderRewardItems implements OrderItemBase {
//   int? id;
//   int? productId;
//   String? productName;
//   String? itemType;
//   String? temperatur;
//   String? size;
//   String? ice;
//   String? sugar;
//   String? note;
//   int? quantity;
//   int? points;
//   int? totalPoints;

//   OrderRewardItems({
//     this.id,
//     this.productId,
//     this.productName,
//     this.itemType,
//     this.temperatur,
//     this.size,
//     this.ice,
//     this.sugar,
//     this.note,
//     this.quantity,
//     this.points,
//     this.totalPoints,
//   });

//   OrderRewardItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     productName = json['product_name'];
//     itemType = json['item_type'];
//     temperatur = json['temperatur'];
//     size = json['size'];
//     ice = json['ice'];
//     sugar = json['sugar'];
//     note = json['note'];
//     quantity = json['quantity'];
//     points = json['points'];
//     totalPoints = json['total_points'];
//   }

//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['product_name'] = this.productName;
//     data['item_type'] = this.itemType;
//     data['temperatur'] = this.temperatur;
//     data['size'] = this.size;
//     data['ice'] = this.ice;
//     data['sugar'] = this.sugar;
//     data['note'] = this.note;
//     data['quantity'] = this.quantity;
//     data['points'] = this.points;
//     data['total_points'] = this.totalPoints;
//     return data;
//   }
// }


// import 'order_item_model.dart';
// import 'order_reward_item.dart';

// class UnifiedOrderItem {
//   final bool isReward;
//   final OrderItems? orderItem;
//   final OrderRewardItems? rewardItem;

//   UnifiedOrderItem({required this.isReward, this.orderItem, this.rewardItem});
// }