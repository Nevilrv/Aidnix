import 'dart:convert';

ResEditHealthDocument resEditHealthDocumentFromJson(String str) => ResEditHealthDocument.fromJson(json.decode(str));

String resEditHealthDocumentToJson(ResEditHealthDocument data) => json.encode(data.toJson());

class ResEditHealthDocument {
  bool? status;
  int? code;
  Data? data;
  String? message;
  dynamic extra;

  ResEditHealthDocument({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResEditHealthDocument.fromJson(Map<String, dynamic> json) => ResEditHealthDocument(
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
  String? docId;
  String? type;
  String? createdAt;
  CreatedBy? createdBy;
  String? fileName;

  Data({
    this.docId,
    this.type,
    this.createdAt,
    this.createdBy,
    this.fileName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        docId: json["doc_id"],
        type: json["type"],
        createdAt: json["created_at"],
        createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
        fileName: json["file_name"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "type": type,
        "created_at": createdAt,
        "created_by": createdBy?.toJson(),
        "file_name": fileName,
      };
}

class CreatedBy {
  String? id;
  String? name;

  CreatedBy({
    this.id,
    this.name,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
