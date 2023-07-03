// To parse this JSON data, do
//
//     final tipoAlceSapModel = tipoAlceSapModelFromJson(jsonString);

import 'dart:convert';

class TipoAlceSapModel {
    /* String domname;
    String valpos;
    String ddlanguage; */
    String domvalueL;
    String ddtext;

    TipoAlceSapModel({
        /* required this.domname,
        required this.valpos,
        required this.ddlanguage, */
        required this.domvalueL,
        required this.ddtext,
    });

    factory TipoAlceSapModel.fromRawJson(String str) => TipoAlceSapModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TipoAlceSapModel.fromJson(Map<String, dynamic> json) => TipoAlceSapModel(
        /* domname: json["Domname"],
        valpos: json["Valpos"],
        ddlanguage: json["Ddlanguage"], */
        domvalueL: json["DomvalueL"],
        ddtext: json["Ddtext"],
    );

    Map<String, dynamic> toJson() => {
        /* "Domname": domname,
        "Valpos": valpos,
        "Ddlanguage": ddlanguage, */
        "DomvalueL": domvalueL,
        "Ddtext": ddtext,
    };
}


class TipoAlceSapModelResponse {
  final List<TipoAlceSapModel> list;

  TipoAlceSapModelResponse(this.list);

  factory TipoAlceSapModelResponse.fromJson(List<dynamic> parsedJson) {
    List<TipoAlceSapModel>  list;
    list = parsedJson.map((i) => TipoAlceSapModel.fromJson(i)).toList();

    return TipoAlceSapModelResponse(list);
  }
}