import 'package:tedikap_admin/app/data/model/order/order_item_model.dart';

class Orders {
  String? id;
  int? userId;
  int? cartId;
  int? voucherId;
  int? totalPrice;
  int? discountAmount;
  int? rewardPoint;
  int? originalPrice;
  String? status;
  String? paymentChannel;
  String? createdAt;
  String? updatedAt;
  String? schedulePickup;
  List<OrderItems>? orderItems;

  Orders(
      {this.id,
      this.userId,
      this.cartId,
      this.voucherId,
      this.totalPrice,
      this.discountAmount,
      this.rewardPoint,
      this.originalPrice,
      this.status,
      this.paymentChannel,
      this.createdAt,
      this.updatedAt,
      this.schedulePickup,
      this.orderItems});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cartId = json['cart_id'];
    voucherId = json['voucher_id'];
    totalPrice = json['total_price'];
    discountAmount = json['discount_amount'];
    rewardPoint = json['reward_point'];
    originalPrice = json['original_price'];
    status = json['status'];
    paymentChannel = json['payment_channel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    schedulePickup = json['schedule_pickup'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['cart_id'] = this.cartId;
    data['voucher_id'] = this.voucherId;
    data['total_price'] = this.totalPrice;
    data['discount_amount'] = this.discountAmount;
    data['reward_point'] = this.rewardPoint;
    data['original_price'] = this.originalPrice;
    data['status'] = this.status;
    data['payment_channel'] = this.paymentChannel;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['schedule_pickup'] = this.schedulePickup;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}