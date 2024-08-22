import 'package:tedikap_admin/app/data/model/box%20promo/box_promo_model.dart';

// class BoxPromoResponse {
//   List<Data>? data;

//   BoxPromoResponse({this.data});

//   BoxPromoResponse.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class BoxPromoResponse {
  Map<String, Data>? data;

  BoxPromoResponse({this.data});

  BoxPromoResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = {};
      json['data'].forEach((key, value) {
        data![key] = Data.fromJson(value);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((key, value) => MapEntry(key, value.toJson()));
    }
    return data;
  }
}

