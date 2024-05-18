import 'dart:convert';

ResSingleLabDetailsApi resSingleLabDetailsApiFromJson(String str) => ResSingleLabDetailsApi.fromJson(json.decode(str));

String resSingleLabDetailsApiToJson(ResSingleLabDetailsApi data) => json.encode(data.toJson());

class ResSingleLabDetailsApi {
  bool? status;
  int? code;
  LabDetail? data;
  String? message;
  dynamic extra;

  ResSingleLabDetailsApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResSingleLabDetailsApi.fromJson(Map<String, dynamic> json) => ResSingleLabDetailsApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : LabDetail.fromJson(json["data"]),
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

class LabDetail {
  String? referenceId;
  String? name;
  String? openTime;
  String? closeTime;
  Image? image;
  String? description;
  DateTime? establishDate;
  String? address;
  Distance? distance;
  String? reviews;
  String? totalTests;

  LabDetail({
    this.referenceId,
    this.name,
    this.openTime,
    this.closeTime,
    this.image,
    this.description,
    this.establishDate,
    this.address,
    this.distance,
    this.reviews,
    this.totalTests,
  });

  factory LabDetail.fromJson(Map<String, dynamic> json) => LabDetail(
        referenceId: json["reference_id"],
        name: json["name"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        description: json["description"],
        establishDate: json["establish_date"] == null ? null : DateTime.parse(json["establish_date"]),
        address: json["address"],
        distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
        reviews: json["reviews"],
        totalTests: json["total_tests"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "open_time": openTime,
        "close_time": closeTime,
        "image": image?.toJson(),
        "description": description,
        "establish_date":
            "${establishDate!.year.toString().padLeft(4, '0')}-${establishDate!.month.toString().padLeft(2, '0')}-${establishDate!.day.toString().padLeft(2, '0')}",
        "address": address,
        "distance": distance?.toJson(),
        "reviews": reviews,
        "total_tests": totalTests,
      };
}

class Distance {
  double? value;
  String? unit;

  Distance({
    this.value,
    this.unit,
  });

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        value: json["value"]?.toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unit,
      };
}

class Image {
  String? code;

  Image({
    this.code,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
