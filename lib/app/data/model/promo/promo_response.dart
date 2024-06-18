import 'dart:convert';

import 'package:tedikap_admin/app/data/model/promo/promo_model.dart';

PromoResponse promoResponseFromJson(String str) => PromoResponse.fromJson(json.decode(str));

String promoModelToJson(PromoResponse data) => json.encode(data.toJson());

class PromoResponse {
    List<ListPromo> data;

    PromoResponse({
        required this.data,
    });

    factory PromoResponse.fromJson(Map<String, dynamic> json) => PromoResponse(
        data: List<ListPromo>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };

}

