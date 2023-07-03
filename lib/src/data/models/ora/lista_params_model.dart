// To parse this JSON data, do
//
//     final ListaParamsOraModel = ListaParamsOraModelFromJson(jsonString);

import 'dart:convert';

class ListaParamsOraModel {
    String reporte;
    String grupo;
    String subgrupo;
    String descripcion;
    String? cosValorDato;

    ListaParamsOraModel({
        required this.reporte,
        required this.grupo,
        required this.subgrupo,
        required this.descripcion,
        this.cosValorDato,
    });

    factory ListaParamsOraModel.fromRawJson(String str) => ListaParamsOraModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListaParamsOraModel.fromJson(Map<String, dynamic> json) => ListaParamsOraModel(
        reporte: json["reporte"],
        grupo: json["grupo"],
        subgrupo: json["subgrupo"],
        descripcion: json["descripcion"],
        cosValorDato: json["cosValorDato"],
    );

    Map<String, dynamic> toJson() => {
        "reporte": reporte,
        "grupo": grupo,
        "subgrupo": subgrupo,
        "descripcion": descripcion,
        "cosValorDato": cosValorDato,
    };
}


class ListaParamsOraModelResponse {
  final List<ListaParamsOraModel> list;

  ListaParamsOraModelResponse(this.list);

  factory ListaParamsOraModelResponse.fromJson(List<dynamic> parsedJson) {
    List<ListaParamsOraModel>  list;
    list = parsedJson.map((i) => ListaParamsOraModel.fromJson(i)).toList();

    return ListaParamsOraModelResponse(list);
  }
}