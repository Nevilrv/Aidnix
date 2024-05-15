import 'dart:convert';

ResTermsAndConditions resTermsAndConditionsFromJson(String str) => ResTermsAndConditions.fromJson(json.decode(str));

String resTermsAndConditionsToJson(ResTermsAndConditions data) => json.encode(data.toJson());

class ResTermsAndConditions {
  bool? status;
  int? code;
  PrivacyData? data;
  String? message;
  Extra? extra;

  ResTermsAndConditions({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResTermsAndConditions.fromJson(Map<String, dynamic> json) => ResTermsAndConditions(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : PrivacyData.fromJson(json["data"]),
        message: json["message"],
        extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
        "message": message,
        "extra": extra?.toJson(),
      };
}

class PrivacyData {
  int? id;
  String? title;
  String? slug;
  int? status;
  String? pageDescription;
  String? description;

  PrivacyData({
    this.id,
    this.title,
    this.slug,
    this.status,
    this.pageDescription,
    this.description,
  });

  factory PrivacyData.fromJson(Map<String, dynamic> json) => PrivacyData(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        status: json["status"],
        pageDescription: json["page_description"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "status": status,
        "page_description": pageDescription,
        "description": description,
      };
}

class Extra {
  int? cartCount;
  int? notificationCount;

  Extra({
    this.cartCount,
    this.notificationCount,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        cartCount: json["cart_count"],
        notificationCount: json["notification_count"],
      );

  Map<String, dynamic> toJson() => {
        "cart_count": cartCount,
        "notification_count": notificationCount,
      };
}
