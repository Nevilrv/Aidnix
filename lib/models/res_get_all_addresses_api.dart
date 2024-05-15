import 'dart:convert';

GetAllAddress getAllAddressFromJson(String str) => GetAllAddress.fromJson(json.decode(str));

String getAllAddressToJson(GetAllAddress data) => json.encode(data.toJson());

class GetAllAddress {
  bool? status;
  int? code;
  List<Address>? data;
  String? message;
  dynamic extra;

  GetAllAddress({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory GetAllAddress.fromJson(Map<String, dynamic> json) => GetAllAddress(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? [] : List<Address>.from(json["data"]!.map((x) => Address.fromJson(x))),
        message: json["message"],
        extra: json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "extra": extra,
      };
}

class Address {
  String? line1;
  String? line2;
  int? pincode;
  String? city;
  String? state;
  String? country;
  String? type;
  String? referenceId;

  Address({
    this.line1,
    this.line2,
    this.pincode,
    this.city,
    this.state,
    this.country,
    this.type,
    this.referenceId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line_1"],
        line2: json["line_2"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        type: json["type"],
        referenceId: json["reference_id"],
      );

  Map<String, dynamic> toJson() => {
        "line_1": line1,
        "line_2": line2,
        "pincode": pincode,
        "city": city,
        "state": state,
        "country": country,
        "type": type,
        "reference_id": referenceId,
      };
}
