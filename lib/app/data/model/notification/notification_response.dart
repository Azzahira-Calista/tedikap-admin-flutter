import 'package:tedikap_admin/app/data/model/notification/notification_model.dart';

class Notificationresponse {
  String? message;
  Data? data;

  Notificationresponse({this.message, this.data});

  Notificationresponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Datas? datas;
  Notification? notification;
  String? token;

  Data({this.datas, this.notification, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    datas = json['datas'] != null ? new Datas.fromJson(json['datas']) : null;
    notification = json['notification'] != null
        ? new Notification.fromJson(json['notification'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datas != null) {
      data['datas'] = this.datas!.toJson();
    }
    if (this.notification != null) {
      data['notification'] = this.notification!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}