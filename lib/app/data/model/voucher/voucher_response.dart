import 'dart:convert';

import 'package:tedikap_admin/app/data/model/voucher/voucher_model.dart';

VoucherResponse voucherResponseFromJson(String str) => VoucherResponse.fromJson(json.decode(str));

String voucherModelToJson(VoucherResponse data) => json.encode(data.toJson());

class VoucherResponse {
  List<Data> data;

  VoucherResponse({required this.data});

  factory VoucherResponse.fromJson(Map<String, dynamic> json) => VoucherResponse(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}