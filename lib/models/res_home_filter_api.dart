import 'dart:convert';

ResHomeFilterApi resHomeFilterApiFromJson(String str) => ResHomeFilterApi.fromJson(json.decode(str));

String resHomeFilterApiToJson(ResHomeFilterApi data) => json.encode(data.toJson());

class ResHomeFilterApi {
  bool? status;
  int? code;
  List<HomeFilterData>? data;
  String? message;
  dynamic extra;

  ResHomeFilterApi({
    this.status,
    this.code,
    this.data,
    this.message,
    this.extra,
  });

  factory ResHomeFilterApi.fromJson(Map<String, dynamic> json) => ResHomeFilterApi(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? [] : List<HomeFilterData>.from(json["data"]!.map((x) => HomeFilterData.fromJson(x))),
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

class HomeFilterData {
  String? name;
  String? type;
  String? key;
  List<Value>? values;

  HomeFilterData({
    this.name,
    this.type,
    this.key,
    this.values,
  });

  factory HomeFilterData.fromJson(Map<String, dynamic> json) => HomeFilterData(
        name: json["name"],
        type: json["type"],
        key: json["key"],
        values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "key": key,
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class Value {
  String? name;
  String? type;
  int? value;

  Value({
    this.name,
    this.type,
    this.value,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        name: json["name"],
        type: json["type"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "Value": value,
      };
}
