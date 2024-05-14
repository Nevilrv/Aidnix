import 'dart:convert';

ResAddAddressesApi resAddAddressesApiFromJson(String str) => ResAddAddressesApi.fromJson(json.decode(str));

String resAddAddressesApiToJson(ResAddAddressesApi data) => json.encode(data.toJson());

class ResAddAddressesApi {
  bool? status;
  int? code;
  Data? data;
  String? message;
  dynamic extra;

  ResAddAddressesApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResAddAddressesApi.fromJson(Map<String, dynamic> json) => ResAddAddressesApi(
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
