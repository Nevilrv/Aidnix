import 'dart:convert';

ResCartDetailsAddApi resCartDetailsAddApiFromJson(String str) => ResCartDetailsAddApi.fromJson(json.decode(str));

String resCartDetailsAddApiToJson(ResCartDetailsAddApi data) => json.encode(data.toJson());

class ResCartDetailsAddApi {
  bool? status;
  int? code;
  AddCartData? data;
  String? message;
  dynamic extra;

  ResCartDetailsAddApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResCartDetailsAddApi.fromJson(Map<String, dynamic> json) => ResCartDetailsAddApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : AddCartData.fromJson(json["data"]),
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

class AddCartData {
  String? id;

  AddCartData({
    this.id,
  });

  factory AddCartData.fromJson(Map<String, dynamic> json) => AddCartData(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
