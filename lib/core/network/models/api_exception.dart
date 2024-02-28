import 'dart:convert';

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

ApiException apiExceptionFromJson(String str) => ApiException.fromJson(json.decode(str));

String apiExceptionToJson(ApiException data) => json.encode(data.toJson());

class ApiException {
  final bool? success;
  final String? information;
  final List<ExceptionModel>? data;

  ApiException({
    this.success,
    this.information,
    this.data,
  });

  ApiException copyWith({
    bool? success,
    String? information,
    List<ExceptionModel>? data,
  }) =>
      ApiException(
        success: success ?? this.success,
        information: information ?? this.information,
        data: data ?? this.data,
      );

  factory ApiException.fromJson(Map<String, dynamic> json) => ApiException(
        success: json["success"],
        information: json["information"],
        data: json["data"] == null ? [] : List<ExceptionModel>.from(json["data"]!.map((x) => ExceptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "information": information,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ExceptionModel {
  final String? key;
  final String? value;

  ExceptionModel({
    this.key,
    this.value,
  });

  ExceptionModel copyWith({
    String? key,
    String? value,
  }) =>
      ExceptionModel(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory ExceptionModel.fromJson(Map<String, dynamic> json) => ExceptionModel(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
