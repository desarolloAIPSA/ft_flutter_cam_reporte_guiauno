// To parse this JSON data, do
//
//     final qrMReadModel = qrMReadModelFromJson(jsonString);

import 'dart:convert';

class QrMReadModel {
    String tracto;
    String? carreta1;
    String? carreta2;
    String? dni;
    String brevete;
    String? cantidad;

    QrMReadModel({
        required this.tracto,
        this.carreta1,
        this.carreta2,
        this.dni,
        required this.brevete,
        this.cantidad,
    });

    factory QrMReadModel.fromRawJson(String str) => QrMReadModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory QrMReadModel.fromJson(Map<String, dynamic> json) => QrMReadModel(
        tracto: json["tracto"],
        carreta1: json["carreta1"],
        carreta2: json["carreta2"],
        dni: json["dni"],
        brevete: json["brevete"],
        cantidad: json["cantidad"],
    );

    Map<String, dynamic> toJson() => {
        "tracto": tracto,
        "carreta1": carreta1,
        "carreta2": carreta2,
        "dni": dni,
        "brevete": brevete,
        "cantidad": cantidad,
    };
}
