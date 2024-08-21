import 'package:tedikap_admin/app/data/model/data_helper.dart';

class Data {
  int? id;
  int? userId;
  String? orderId;
  String? name;
  String? avatar;
  double? staffService;
  double? productQuality;
  String? note;

  Data({
    this.id,
    this.userId,
    this.orderId,
    this.name,
    this.avatar,
    this.staffService,
    this.productQuality,
    this.note,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = DataHelper.parseInt(json['id']);
    userId = DataHelper.parseInt(json['user_id']);
    orderId = DataHelper.parseString(json['order_id']);
    name = DataHelper.parseString(json['name']);
    avatar = DataHelper.parseString(json['avatar']);
    staffService = DataHelper.parseDouble(json['staff_service']);
    productQuality = DataHelper.parseDouble(json['product_quality']);
    note = DataHelper.parseString(json['note']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_id'] = orderId;
    data['name'] = name;
    data['avatar'] = avatar;
    data['staff_service'] = staffService;
    data['product_quality'] = productQuality;
    data['note'] = note;
    return data;
  }
}
