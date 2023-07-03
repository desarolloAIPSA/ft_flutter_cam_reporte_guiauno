// To parse this JSON data, do
//
//     final maquinariaAlceSapModel = maquinariaAlceSapModelFromJson(jsonString);

import 'dart:convert';

class MaquinariaAlceSapModel {
    String lifnr;
    String zzMaqalce;

    MaquinariaAlceSapModel({
        required this.lifnr,
        required this.zzMaqalce,
    });

    factory MaquinariaAlceSapModel.fromRawJson(String str) => MaquinariaAlceSapModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MaquinariaAlceSapModel.fromJson(Map<String, dynamic> json) => MaquinariaAlceSapModel(
        lifnr: json["Lifnr"],
        zzMaqalce: json["ZzMaqalce"],
    );

    Map<String, dynamic> toJson() => {
        "Lifnr": lifnr,
        "ZzMaqalce": zzMaqalce,
    };
}


class MaquinariaAlceSapModelResponse {
  final List<MaquinariaAlceSapModel> list;

  MaquinariaAlceSapModelResponse(this.list);

  factory MaquinariaAlceSapModelResponse.fromJson(List<dynamic> parsedJson) {
    List<MaquinariaAlceSapModel>  list;
    list = parsedJson.map((i) => MaquinariaAlceSapModel.fromJson(i)).toList();

    return MaquinariaAlceSapModelResponse(list);
  }
}