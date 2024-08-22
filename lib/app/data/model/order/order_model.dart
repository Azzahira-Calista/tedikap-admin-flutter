// ignore_for_file: unnecessary_this

import 'order_item_model.dart';
import 'order_reward_item.dart';

class Orders {
  String? id;
  int? userId;
  int? cartId;
  String? name;
  String? avatar;
  int? voucherId;
  int? totalPrice;
  int? discountAmount;
  int? rewardPoint;
  int? originalPrice;
  String? status;
  String? orderType;
  String? paymentChannel;
  String? createdAt;
  String? updatedAt;
  String? schedulePickup;
  List<OrderItems>? orderItems;
  int? cartRewardId;
  int? totalPoint;
  List<OrderRewardItems>? orderRewardItems;

  String? statusDescription;
  String? whatsapp;
  String? iconStatus;
  bool? cartLength;
  double? rating;
  String? expiresAt;

  Orders(
      {this.id,
      this.userId,
      this.cartId,
      this.name,
      this.avatar,
      this.voucherId,
      this.totalPrice,
      this.discountAmount,
      this.rewardPoint,
      this.originalPrice,
      this.status,
      this.orderType,
      this.paymentChannel,
      this.createdAt,
      this.updatedAt,
      this.schedulePickup,
      this.orderItems,
      this.cartRewardId,
      this.totalPoint,
      this.orderRewardItems,

      this.statusDescription,
      this.whatsapp,
      this.iconStatus,
      this.cartLength,
      this.rating,
      this.expiresAt,});

 Orders.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  userId = json['user_id'];
  cartId = json['cart_id'];
  name = json['name'];
  avatar = json['avatar'];
  voucherId = json['voucher_id'];
  totalPrice = json['total_price'];
  discountAmount = json['discount_amount'];
  rewardPoint = json['reward_point'];
  originalPrice = json['original_price'];
  status = json['status'];
  statusDescription = json['status_description'];
  whatsapp = json['whatsapp'];
  orderType = json['order_type'];
  schedulePickup = json['schedule_pickup'];
  iconStatus = json['icon_status'];
  paymentChannel = json['payment_channel'];
  cartLength = json['cart_length'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  expiresAt = json['expires_at'];

  // Handle rating field to accommodate both int and double
  if (json['rating'] != null) {
    if (json['rating'] is int) {
      rating = (json['rating'] as int).toDouble();
    } else {
      rating = json['rating'] as double?;
    }
  } else {
    rating = null;
  }

  if (json['order_items'] != null) {
    orderItems = <OrderItems>[];
    json['order_items'].forEach((v) {
      orderItems!.add(OrderItems.fromJson(v));
    });
  }

  cartRewardId = json['cart_reward_id'];
  totalPoint = json['total_point'];

  if (json['order_reward_items'] != null) {
    orderRewardItems = <OrderRewardItems>[];
    json['order_reward_items'].forEach((v) {
      orderRewardItems!.add(OrderRewardItems.fromJson(v));
    });
  }
}


  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = id;
  data['user_id'] = userId;
  data['cart_id'] = cartId;
  data['name'] = name;
  data['avatar'] = avatar;
  data['voucher_id'] = voucherId;
  data['total_price'] = totalPrice;
  data['discount_amount'] = discountAmount;
  data['reward_point'] = rewardPoint;
  data['original_price'] = originalPrice;
  data['status'] = status;
  data['status_description'] = statusDescription;
  data['whatsapp'] = whatsapp;
  data['order_type'] = orderType;
  data['schedule_pickup'] = schedulePickup;
  data['icon_status'] = iconStatus;
  data['payment_channel'] = paymentChannel;
  data['cart_length'] = cartLength;
  
  // Ensure rating is serialized as double
  data['rating'] = rating;
  
  data['created_at'] = createdAt;
  data['updated_at'] = updatedAt;
  data['expires_at'] = expiresAt;
  
  if (orderItems != null) {
    data['order_items'] = orderItems!.map((v) => v.toJson()).toList();
  }
  
  data['cart_reward_id'] = cartRewardId;
  data['total_point'] = totalPoint;
  
  if (orderRewardItems != null) {
    data['order_reward_items'] = orderRewardItems!.map((v) => v.toJson()).toList();
  }
  
  return data;
}

}