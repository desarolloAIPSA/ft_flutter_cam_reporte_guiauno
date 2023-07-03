// To parse this JSON data, do
//
//     final establecimientoOraModel = establecimientoOraModelFromJson(jsonString);

import 'dart:convert';

class EstablecimientoOraModel {
    String establecimiento;
    String ubigeo;

    EstablecimientoOraModel({
        required this.establecimiento,
        required this.ubigeo,
    });

    factory EstablecimientoOraModel.fromRawJson(String str) => EstablecimientoOraModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EstablecimientoOraModel.fromJson(Map<String, dynamic> json) => EstablecimientoOraModel(
        establecimiento: json["establecimiento"],
        ubigeo: json["ubigeo"],
    );

    Map<String, dynamic> toJson() => {
        "establecimiento": establecimiento,
        "ubigeo": ubigeo,
    };
}
