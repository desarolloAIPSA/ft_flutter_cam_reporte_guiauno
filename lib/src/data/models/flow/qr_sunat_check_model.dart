// To parse this JSON data, do
//
//     final qrSunatCkeckModel = qrSunatCkeckModelFromJson(jsonString);

import 'dart:convert';

class QrSunatCkeckModel {
    String nroGuia;
    String reNroDoc;
    String placa;
    String feha;
    String razonSocial;
    String link;

    QrSunatCkeckModel({
        required this.nroGuia,
        required this.reNroDoc,
        required this.placa,
        required this.feha,
        required this.razonSocial,
        required this.link,
    });

    factory QrSunatCkeckModel.fromRawJson(String str) => QrSunatCkeckModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory QrSunatCkeckModel.fromJson(Map<String, dynamic> json) => QrSunatCkeckModel(
        nroGuia: json["nroGuia"],
        reNroDoc: json["reNroDoc"],
        placa: json["placa"],
        feha: json["feha"],
        razonSocial: json["razonSocial"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "nroGuia": nroGuia,
        "reNroDoc": reNroDoc,
        "placa": placa,
        "feha": feha,
        "razonSocial": razonSocial,
        "link": link,
    };
}
