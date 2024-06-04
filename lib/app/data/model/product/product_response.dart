import 'dart:convert';

import 'data_model.dart';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productModelToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
    List<Data> data;

    ProductResponse({
        required this.data,
    });

    factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };

}

