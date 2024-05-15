import 'dart:convert';

ResHealthDocs resHealthDocsFromJson(String str) => ResHealthDocs.fromJson(json.decode(str));

String resHealthDocsToJson(ResHealthDocs data) => json.encode(data.toJson());

class ResHealthDocs {
  bool? status;
  int? code;
  List<dynamic>? data;
  String? message;
  dynamic extra;

  ResHealthDocs({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResHealthDocs.fromJson(Map<String, dynamic> json) => ResHealthDocs(
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
