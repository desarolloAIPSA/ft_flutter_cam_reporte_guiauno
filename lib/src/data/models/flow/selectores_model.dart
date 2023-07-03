import 'dart:convert';

import 'package:reporte_guia/src/data/models/option_model.dart';

class SelectoresModel {
  Option alce;
  Option maquinaria;
  Option quemada;

  SelectoresModel({
        required this.alce,
        required this.maquinaria,
        required this.quemada,
    });

    factory SelectoresModel.fromRawJson(String str) => SelectoresModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SelectoresModel.fromJson(Map<String, dynamic> json) => SelectoresModel(
        alce: json["alce"],
        maquinaria: json["maquinaria"],
        quemada: json["quemada"],
    );

    Map<String, dynamic> toJson() => {
        "alce": alce,
        "maquinaria": maquinaria,
        "quemada": quemada,
    };
}
