// To parse this JSON data, do
//
//     final ordCosSapModel = ordCosSapModelFromJson(jsonString);

import 'dart:convert';

class OrdCosSapModel {
  String zprogCosecha;
  String ztpcorte;
  String status;
  String proyecto;
  String admin;
  String zona;
  String campo;
  String quiebre;
  String descrip;
  String flagQuema;
  String ubigeo;
  String frenteCos;

  OrdCosSapModel({
    required this.zprogCosecha,
    required this.ztpcorte,
    required this.status,
    required this.proyecto,
    required this.admin,
    required this.zona,
    required this.campo,
    required this.quiebre,
    required this.descrip,
    required this.flagQuema,
    required this.ubigeo,
    required this.frenteCos,
  });

  factory OrdCosSapModel.fromRawJson(String str) => OrdCosSapModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrdCosSapModel.fromJson(Map<String, dynamic> json) => OrdCosSapModel(
        zprogCosecha: json["ZprogCosecha"],
        ztpcorte: json["Ztpcorte"],
        status: json["Status"],
        proyecto: json["Proyecto"],
        admin: json["Admin"],
        zona: json["Zona"],
        campo: json["Campo"],
        quiebre: json["Quiebre"],
        descrip: json["Descrip"],
        flagQuema: json["FlagQuema"],
        ubigeo: json["Ubigeo"],
        frenteCos: json["FrenteCos"],
      );

  Map<String, dynamic> toJson() => {
        "ZprogCosecha": zprogCosecha,
        "Ztpcorte": ztpcorte,
        "Status": status,
        "Proyecto": proyecto,
        "Admin": admin,
        "Zona": zona,
        "Campo": campo,
        "Quiebre": quiebre,
        "Descrip": descrip,
        "FlagQuema": flagQuema,
        "Ubigeo": ubigeo,
        "FrenteCos": frenteCos,
      };
}

class OrdCosSapModelResponse {
  final List<OrdCosSapModel> list;

  OrdCosSapModelResponse(this.list);

  factory OrdCosSapModelResponse.fromJson(List<dynamic> parsedJson) {
    List<OrdCosSapModel> list;
    list = parsedJson.map((i) => OrdCosSapModel.fromJson(i)).toList();

    return OrdCosSapModelResponse(list);
  }
}
