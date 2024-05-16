import 'dart:convert';

ResHomeSearchApi resHomeSearchApiFromJson(String str) => ResHomeSearchApi.fromJson(json.decode(str));

String resHomeSearchApiToJson(ResHomeSearchApi data) => json.encode(data.toJson());

class ResHomeSearchApi {
  bool? status;
  int? code;
  List<SearchHomeData>? data;
  String? message;
  dynamic extra;

  ResHomeSearchApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResHomeSearchApi.fromJson(Map<String, dynamic> json) => ResHomeSearchApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? [] : List<SearchHomeData>.from(json["data"]!.map((x) => SearchHomeData.fromJson(x))),
        message: json["message"],
        extra: json["extra"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "extra": extra,
      };
}

class SearchHomeData {
  String? referenceId;
  double? amount;
  int? discount;
  int? totalPrice;
  String? discountType;
  String? discountTag;
  bool? homeVisit;
  int? reportTime;
  String? name;
  String? description;
  Test? test;
  Lab? lab;
  dynamic image;

  SearchHomeData({
    this.referenceId,
    this.amount,
    this.discount,
    this.totalPrice,
    this.discountType,
    this.discountTag,
    this.homeVisit,
    this.reportTime,
    this.name,
    this.description,
    this.test,
    this.lab,
    this.image,
  });

  factory SearchHomeData.fromJson(Map<String, dynamic> json) => SearchHomeData(
        referenceId: json["reference_id"],
        amount: json["amount"]?.toDouble(),
        discount: json["discount"],
        totalPrice: json["total_price"],
        discountType: json["discount_type"],
        discountTag: json["discount_tag"],
        homeVisit: json["home_visit"],
        reportTime: json["report_time"],
        name: json["name"],
        description: json["description"],
        test: json["test"] == null ? null : Test.fromJson(json["test"]),
        lab: json["lab"] == null ? null : Lab.fromJson(json["lab"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "amount": amount,
        "discount": discount,
        "total_price": totalPrice,
        "discount_type": discountType,
        "discount_tag": discountTag,
        "home_visit": homeVisit,
        "report_time": reportTime,
        "name": name,
        "description": description,
        "test": test?.toJson(),
        "lab": lab?.toJson(),
        "image": image,
      };
}

class Lab {
  String? referenceId;
  String? name;
  LabImage? image;
  String? address;
  Distance? distance;
  String? reviews;
  String? totalTests;

  Lab({
    this.referenceId,
    this.name,
    this.image,
    this.address,
    this.distance,
    this.reviews,
    this.totalTests,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        referenceId: json["reference_id"],
        name: json["name"],
        image: json["image"] == null ? null : LabImage.fromJson(json["image"]),
        address: json["address"],
        distance: json["distance"] == null ? null : Distance.fromJson(json["distance"]),
        reviews: json["reviews"],
        totalTests: json["total_tests"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "image": image?.toJson(),
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

class LabImage {
  String? code;
  int? cacheValidity;

  LabImage({
    this.code,
    this.cacheValidity,
  });

  factory LabImage.fromJson(Map<String, dynamic> json) => LabImage(
        code: json["code"],
        cacheValidity: json["cache_validity"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "cache_validity": cacheValidity,
      };
}

class Test {
  String? referenceId;
  String? desc;
  TitleImageClass? image;
  TestCategory? testCategory;
  dynamic samples;
  String? parameters;
  dynamic advices;
  IncludedTests? includedTests;

  Test({
    this.referenceId,
    this.desc,
    this.image,
    this.testCategory,
    this.samples,
    this.parameters,
    this.advices,
    this.includedTests,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        referenceId: json["reference_id"],
        desc: json["desc"],
        image: json["image"] == null ? null : TitleImageClass.fromJson(json["image"]),
        testCategory: json["test_category"] == null ? null : TestCategory.fromJson(json["test_category"]),
        samples: json["samples"],
        parameters: json["parameters"],
        advices: json["advices"],
        includedTests: json["included_tests"] == null ? null : IncludedTests.fromJson(json["included_tests"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "desc": desc,
        "image": image?.toJson(),
        "test_category": testCategory?.toJson(),
        "samples": samples,
        "parameters": parameters,
        "advices": advices,
        "included_tests": includedTests?.toJson(),
      };
}

class TitleImageClass {
  TitleImageClass();

  factory TitleImageClass.fromJson(Map<String, dynamic> json) => TitleImageClass();

  Map<String, dynamic> toJson() => {};
}

class IncludedTests {
  String? count;
  dynamic names;

  IncludedTests({
    this.count,
    this.names,
  });

  factory IncludedTests.fromJson(Map<String, dynamic> json) => IncludedTests(
        count: json["count"],
        names: json["names"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "names": names,
      };
}

class TestCategory {
  TitleImageClass? image;
  Cta? cta;

  TestCategory({
    this.image,
    this.cta,
  });

  factory TestCategory.fromJson(Map<String, dynamic> json) => TestCategory(
        image: json["image"] == null ? null : TitleImageClass.fromJson(json["image"]),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
        "cta": cta?.toJson(),
      };
}

class Cta {
  TitleImageClass? titleImage;

  Cta({
    this.titleImage,
  });

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
        titleImage: json["title_image"] == null ? null : TitleImageClass.fromJson(json["title_image"]),
      );

  Map<String, dynamic> toJson() => {
        "title_image": titleImage?.toJson(),
      };
}
