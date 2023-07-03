// To parse this JSON data, do
//
//     final parametroCase1OraModel = parametroCase1OraModelFromJson(jsonString);

import 'dart:convert';

class ParametroCase1OraModel {
    String grVersionUbl;
    String grVersionDoc;
    String tipoDocRuc;
    String deTipoDoc;
    String deNroDoc;
    String deRazonSocial;
    String undTon;
    String pllUbigeoLlegada;
    String pllDireccion;
    String pllCodEstablecimiento;
    String biDescBien;
    String biCodBien;

    ParametroCase1OraModel({
        required this.grVersionUbl,
        required this.grVersionDoc,
        required this.tipoDocRuc,
        required this.deTipoDoc,
        required this.deNroDoc,
        required this.deRazonSocial,
        required this.undTon,
        required this.pllUbigeoLlegada,
        required this.pllDireccion,
        required this.pllCodEstablecimiento,
        required this.biDescBien,
        required this.biCodBien,
    });

    factory ParametroCase1OraModel.fromRawJson(String str) => ParametroCase1OraModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ParametroCase1OraModel.fromJson(Map<String, dynamic> json) => ParametroCase1OraModel(
        grVersionUbl: json["grVersionUbl"],
        grVersionDoc: json["grVersionDoc"],
        tipoDocRuc: json["tipoDocRuc"],
        deTipoDoc: json["deTipoDoc"],
        deNroDoc: json["deNroDoc"],
        deRazonSocial: json["deRazonSocial"],
        undTon: json["undTon"],
        pllUbigeoLlegada: json["pllUbigeoLlegada"],
        pllDireccion: json["pllDireccion"],
        pllCodEstablecimiento: json["pllCodEstablecimiento"],
        biDescBien: json["biDescBien"],
        biCodBien: json["biCodBien"],
    );

    Map<String, dynamic> toJson() => {
        "grVersionUbl": grVersionUbl,
        "grVersionDoc": grVersionDoc,
        "tipoDocRuc": tipoDocRuc,
        "deTipoDoc": deTipoDoc,
        "deNroDoc": deNroDoc,
        "deRazonSocial": deRazonSocial,
        "undTon": undTon,
        "pllUbigeoLlegada": pllUbigeoLlegada,
        "pllDireccion": pllDireccion,
        "pllCodEstablecimiento": pllCodEstablecimiento,
        "biDescBien": biDescBien,
        "biCodBien": biCodBien,
    };
}
