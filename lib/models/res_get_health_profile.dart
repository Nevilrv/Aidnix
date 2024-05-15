import 'dart:convert';

ResGetHealthProfile resGetHealthProfileFromJson(String str) => ResGetHealthProfile.fromJson(json.decode(str));

String resGetHealthProfileToJson(ResGetHealthProfile data) => json.encode(data.toJson());

class ResGetHealthProfile {
  bool? status;
  int? code;
  HealthData? data;
  String? message;
  dynamic extra;

  ResGetHealthProfile({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResGetHealthProfile.fromJson(Map<String, dynamic> json) => ResGetHealthProfile(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : HealthData.fromJson(json["data"]),
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

class HealthData {
  Height? height;
  Weight? weight;
  DropDowns? dropDowns;

  HealthData({
    this.height,
    this.weight,
    this.dropDowns,
  });

  factory HealthData.fromJson(Map<String, dynamic> json) => HealthData(
        height: json["height"] == null ? null : Height.fromJson(json["height"]),
        weight: json["weight"] == null ? null : Weight.fromJson(json["weight"]),
        dropDowns: json["drop_downs"] == null ? null : DropDowns.fromJson(json["drop_downs"]),
      );

  Map<String, dynamic> toJson() => {
        "height": height?.toJson(),
        "weight": weight?.toJson(),
        "drop_downs": dropDowns?.toJson(),
      };
}

class DropDowns {
  List<String>? activityLevels;
  List<String>? smokingLevels;
  List<String>? chronicDiseases;

  DropDowns({
    this.activityLevels,
    this.smokingLevels,
    this.chronicDiseases,
  });

  factory DropDowns.fromJson(Map<String, dynamic> json) => DropDowns(
        activityLevels: json["activity_levels"] == null ? [] : List<String>.from(json["activity_levels"]!.map((x) => x)),
        smokingLevels: json["smoking_levels"] == null ? [] : List<String>.from(json["smoking_levels"]!.map((x) => x)),
        chronicDiseases: json["chronic_diseases"] == null ? [] : List<String>.from(json["chronic_diseases"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "activity_levels": activityLevels == null ? [] : List<dynamic>.from(activityLevels!.map((x) => x)),
        "smoking_levels": smokingLevels == null ? [] : List<dynamic>.from(smokingLevels!.map((x) => x)),
        "chronic_diseases": chronicDiseases == null ? [] : List<dynamic>.from(chronicDiseases!.map((x) => x)),
      };
}

class Height {
  Height();

  factory Height.fromJson(Map<String, dynamic> json) => Height();

  Map<String, dynamic> toJson() => {};
}

class Weight {
  int? value;
  String? unit;

  Weight({
    this.value,
    this.unit,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        value: json["value"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unit,
      };
}
