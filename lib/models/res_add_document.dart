import 'dart:convert';

ResAddDocument resAddDocumentFromJson(String str) => ResAddDocument.fromJson(json.decode(str));

String resAddDocumentToJson(ResAddDocument data) => json.encode(data.toJson());

class ResAddDocument {
  bool? status;
  int? code;
  ImageData? data;
  String? message;
  dynamic extra;

  ResAddDocument({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResAddDocument.fromJson(Map<String, dynamic> json) => ResAddDocument(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : ImageData.fromJson(json["data"]),
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

class ImageData {
  String? docId;
  String? url;
  String? method;

  ImageData({
    this.docId,
    this.url,
    this.method,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        docId: json["doc_id"],
        url: json["url"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "url": url,
        "method": method,
      };
}
