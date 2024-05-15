import 'dart:convert';
import 'package:aidnix/models/res_get_all_addresses_api.dart';

GetAddressDetail getAddressDetailFromJson(String str) => GetAddressDetail.fromJson(json.decode(str));

String getAddressDetailToJson(GetAddressDetail data) => json.encode(data.toJson());

class GetAddressDetail {
  bool? status;
  int? code;
  Address? data;
  String? message;
  dynamic extra;

  GetAddressDetail({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory GetAddressDetail.fromJson(Map<String, dynamic> json) => GetAddressDetail(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : Address.fromJson(json["data"]),
        message: json["message"],
        extra: json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
        "message": message,
        "extra": extra,
      };
}
