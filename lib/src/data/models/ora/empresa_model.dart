// To parse this JSON data, do
//
//     final empresaOraModel = empresaOraModelFromJson(jsonString);

import 'dart:convert';

class EmpresaOraModel {
    String ruc;
    String nombre;
    String codMotTraslado;
    String descMotTraslado;
    String establecLlegada;

    EmpresaOraModel({
        required this.ruc,
        required this.nombre,
        required this.codMotTraslado,
        required this.descMotTraslado,
        required this.establecLlegada,
    });

    factory EmpresaOraModel.fromRawJson(String str) => EmpresaOraModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EmpresaOraModel.fromJson(Map<String, dynamic> json) => EmpresaOraModel(
        ruc: json["ruc"],
        nombre: json["nombre"],
        codMotTraslado: json["codMotTraslado"],
        descMotTraslado: json["descMotTraslado"],
        establecLlegada: json["establecLlegada"],
    );

    Map<String, dynamic> toJson() => {
        "ruc": ruc,
        "nombre": nombre,
        "codMotTraslado": codMotTraslado,
        "establecLlegada": establecLlegada,
    };
}

class EmpresaOraModelResponse {
  final List<EmpresaOraModel> list;

  EmpresaOraModelResponse(this.list);

  factory EmpresaOraModelResponse.fromJson(List<dynamic> parsedJson) {
    List<EmpresaOraModel>  list;
    list = parsedJson.map((i) => EmpresaOraModel.fromJson(i)).toList();

    return EmpresaOraModelResponse(list);
  }
}