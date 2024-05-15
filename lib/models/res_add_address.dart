import 'dart:convert';

ResAddAddress resAddAddressFromJson(String str) => ResAddAddress.fromJson(json.decode(str));

String resAddAddressToJson(ResAddAddress data) => json.encode(data.toJson());

class ResAddAddress {
  bool? status;
  int? code;
  Data? data;
  String? message;
  dynamic extra;

  ResAddAddress({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResAddAddress.fromJson(Map<String, dynamic> json) => ResAddAddress(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  String? id;

  Data({
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
