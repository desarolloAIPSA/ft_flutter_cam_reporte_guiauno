// To parse this JSON data, do
//
//     final guiaTermoinadaC1Model = guiaTermoinadaC1ModelFromJson(jsonString);

import 'dart:convert';

class GuiaTermoinadaC1Model {
  String grNroGuia;
  String reNroDoc;
  String placa1;
  String grFecEmision;
  String grHoraEmision;
  String? trRazonSocial;
  String? hashQr;
  String? nroRegistroSap;
  String operadorSap;
  String? estadoEnvio;
  String? nomTransportista;


  GuiaTermoinadaC1Model({
    required this.grNroGuia,
    required this.reNroDoc,
    required this.placa1,
    required this.grFecEmision,
    required this.grHoraEmision,
    this.trRazonSocial,
    this.hashQr,
    this.nroRegistroSap,
    required this.operadorSap,
    this.estadoEnvio,
    this.nomTransportista,
  });

  factory GuiaTermoinadaC1Model.fromRawJson(String str) => GuiaTermoinadaC1Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GuiaTermoinadaC1Model.fromJson(Map<String, dynamic> json) => GuiaTermoinadaC1Model(
        grNroGuia: json["grNroGuia"],
        reNroDoc: json["reNroDoc"],
        placa1: json["placa1"],
        grFecEmision: json["grFecEmision"],
        grHoraEmision: json["grHoraEmision"],
        trRazonSocial: json["trRazonSocial"],
        hashQr: json["hashQr"],
        nroRegistroSap: json["nroRegistroSap"],
        operadorSap: json["operadorSap"],
        estadoEnvio: json["estadoEnvio"],
        nomTransportista: json["nomTransportista"],
      );

  Map<String, dynamic> toJson() => {
        "grNroGuia": grNroGuia,
        "reNroDoc": reNroDoc,
        "placa1": placa1,
        "grFecEmision": grFecEmision,
        "grHoraEmision": grHoraEmision,
        "trRazonSocial": trRazonSocial,
        "hashQr": hashQr,
        "nroRegistroSap": nroRegistroSap,
        "operadorSap": operadorSap,
        "estadoEnvio": estadoEnvio,
        "nomTransportista": nomTransportista,
      };
}

class GuiaTermoinadaC1ModelResponse {
  final List<GuiaTermoinadaC1Model> list;

  GuiaTermoinadaC1ModelResponse(this.list);

  factory GuiaTermoinadaC1ModelResponse.fromJson(List<dynamic> parsedJson) {
    List<GuiaTermoinadaC1Model> list;
    list = parsedJson.map((i) => GuiaTermoinadaC1Model.fromJson(i)).toList();

    return GuiaTermoinadaC1ModelResponse(list);
  }
}
