import 'package:tedikap_admin/app/data/model/promo/promo_model.dart';

class PromoResponse {
  List<Promo>? promo;

  PromoResponse({this.promo});

  PromoResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      promo = <Promo>[];
      json['data'].forEach((v) {
        promo!.add(new Promo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promo != null) {
      data['data'] = this.promo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

