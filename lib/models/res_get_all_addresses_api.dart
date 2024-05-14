import 'dart:convert';

ResGetAllAddressesApi resGetAllAddressesApiFromJson(String str) => ResGetAllAddressesApi.fromJson(json.decode(str));

String resGetAllAddressesApiToJson(ResGetAllAddressesApi data) => json.encode(data.toJson());

class ResGetAllAddressesApi {
  bool? status;
  int? code;
  List<dynamic>? data;
  String? message;
  dynamic extra;

  ResGetAllAddressesApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetAllAddressesApi.fromJson(Map<String, dynamic> json) => ResGetAllAddressesApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        message: json["message"],
        extra: json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "message": message,
        "extra": extra,
      };
}
