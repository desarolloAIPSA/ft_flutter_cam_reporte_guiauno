// To parse this JSON data, do
//
//     final uriModel = uriModelFromJson(jsonString);

import 'dart:convert';

class UriModel {
    Map<String, dynamic> queryParameters;
    dynamic bodyParameters;

    UriModel({
        required this.queryParameters,
        this.bodyParameters,
    });

    factory UriModel.fromRawJson(String str) => UriModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UriModel.fromJson(Map<String, dynamic> json) => UriModel(
        queryParameters: json["queryParameters"],
        bodyParameters: json["bodyParameters"],
    );

    Map<String, dynamic> toJson() => {
        "queryParameters": queryParameters,
        "bodyParameters": bodyParameters,
    };
}
