import 'dart:convert';

import 'data_model.dart';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productModelToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
  List<Data>? data;

  ProductResponse({this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
