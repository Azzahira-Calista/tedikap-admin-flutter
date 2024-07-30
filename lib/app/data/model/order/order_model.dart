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
      this.orderRewardItems});

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
    orderType = json['order_type'];
    paymentChannel = json['payment_channel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    schedulePickup = json['schedule_pickup'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['cart_id'] = this.cartId;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['voucher_id'] = this.voucherId;
    data['total_price'] = this.totalPrice;
    data['discount_amount'] = this.discountAmount;
    data['reward_point'] = this.rewardPoint;
    data['original_price'] = this.originalPrice;
    data['status'] = this.status;
    data['order_type'] = this.orderType;
    data['payment_channel'] = this.paymentChannel;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['schedule_pickup'] = this.schedulePickup;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    data['cart_reward_id'] = this.cartRewardId;
    data['total_point'] = this.totalPoint;
    if (this.orderRewardItems != null) {
      data['order_reward_items'] =
          this.orderRewardItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}