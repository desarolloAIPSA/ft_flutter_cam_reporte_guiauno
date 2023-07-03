// To parse this JSON data, do
//
//     final reporte1Model = reporte1ModelFromJson(jsonString);

import 'dart:convert';

class Reporte1Model {
    String grNroGuia;
    String reNroDoc;
    String? placa1;
    String? grFecEmision;
    String? grHoraEmision;
    String? hashQr;
    String? estadoEnvio;
    String? nomTransportista;
    String? placa2;
    String? placa3;
    String? brevete;
    String? nroOrdenCosecha;
    String? ppDireccion;
    String? flagQuema;
    int? biCantidad;
    String? biUnd;
    String? tipoAlce;
    String? maqAlce;
    String? codOperador;
    String? operador;
    String? fecArriboCampo;
    String? fecSalidaCampo;
    String? fecIniAlce;
    String? fecFinAlce;
    String? ticket;
    String? estadoBaja;

    Reporte1Model({
        required this.grNroGuia,
        required this.reNroDoc,
        this.placa1,
        this.grFecEmision,
        this.grHoraEmision,
        this.hashQr,
        this.estadoEnvio,
        this.nomTransportista,
        this.placa2,
        this.placa3,
        this.brevete,
        this.nroOrdenCosecha,
        this.ppDireccion,
        this.flagQuema,
        this.biCantidad,
        this.biUnd,
        this.tipoAlce,
        this.maqAlce,
        this.codOperador,
        this.operador,
        this.fecArriboCampo,
        this.fecSalidaCampo,
        this.fecIniAlce,
        this.fecFinAlce,
        this.ticket,
        this.estadoBaja,
    });

    factory Reporte1Model.fromRawJson(String str) => Reporte1Model.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Reporte1Model.fromJson(Map<String, dynamic> json) => Reporte1Model(
        grNroGuia: json["grNroGuia"],
        reNroDoc: json["reNroDoc"],
        placa1: json["placa1"],
        grFecEmision: json["grFecEmision"],
        grHoraEmision: json["grHoraEmision"],
        hashQr: json["hashQr"],
        estadoEnvio: json["estadoEnvio"],
        nomTransportista: json["nomTransportista"],
        placa2: json["placa2"],
        placa3: json["placa3"],
        brevete: json["brevete"],
        nroOrdenCosecha: json["nroOrdenCosecha"],
        ppDireccion: json["ppDireccion"],
        flagQuema: json["flagQuema"],
        biCantidad: json["biCantidad"],
        biUnd: json["biUnd"],
        tipoAlce: json["tipoAlce"],
        maqAlce: json["maqAlce"],
        codOperador: json["codOperador"],
        operador: json["operador"],
        fecArriboCampo: json["fecArriboCampo"],
        fecSalidaCampo: json["fecSalidaCampo"],
        fecIniAlce: json["fecIniAlce"],
        fecFinAlce: json["fecFinAlce"],
        ticket: json["ticket"],
        estadoBaja: json["estadoBaja"],
    );

    Map<String, dynamic> toJson() => {
        "grNroGuia": grNroGuia,
        "reNroDoc": reNroDoc,
        "placa1": placa1,
        "grFecEmision": grFecEmision,
        "grHoraEmision": grHoraEmision,
        "hashQr": hashQr,
        "estadoEnvio": estadoEnvio,
        "nomTransportista": nomTransportista,
        "placa2": placa2,
        "placa3": placa3,
        "brevete": brevete,
        "nroOrdenCosecha": nroOrdenCosecha,
        "ppDireccion": ppDireccion,
        "flagQuema": flagQuema,
        "biCantidad": biCantidad,
        "biUnd": biUnd,
        "tipoAlce": tipoAlce,
        "maqAlce": maqAlce,
        "codOperador": codOperador,
        "operador": operador,
        "fecArriboCampo": fecArriboCampo,
        "fecSalidaCampo": fecSalidaCampo,
        "fecIniAlce": fecIniAlce,
        "fecFinAlce": fecFinAlce,
        "ticket": ticket,
        "estadoBaja": estadoBaja,
    };
}


class Reporte1ModelResponse {
  final List<Reporte1Model> list;

  Reporte1ModelResponse(this.list);

  factory Reporte1ModelResponse.fromJson(List<dynamic> parsedJson) {
    List<Reporte1Model>  list;
    list = parsedJson.map((i) => Reporte1Model.fromJson(i)).toList();

    return Reporte1ModelResponse(list);
  }
}