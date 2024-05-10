import 'dart:convert';

CommonResponse commonResponseFromJson(String str) => CommonResponse.fromJson(json.decode(str));

String commonResponseToJson(CommonResponse data) => json.encode(data.toJson());

class CommonResponse {
  bool? status;
  String? message;
  List<dynamic>? data;
  int? code;

  CommonResponse({
    this.status,
    this.message,
    this.data,
    this.code,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "code": code,
      };
}
