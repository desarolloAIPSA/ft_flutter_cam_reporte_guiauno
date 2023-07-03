// To parse this JSON data, do
//
//     final tranportistaDbModel = tranportistaDbModelFromJson(jsonString);

import 'dart:convert';

class TranportistaDbModel {
    int? id;
    String placa;
    String? nroGuia;
    String valor;
    String? finternet;
    String? url;
    int? page;

    TranportistaDbModel({
        this.id,
        required this.placa,
        this.nroGuia,
        required this.valor,
        this.finternet,
        this.url,
        this.page,
    });

    factory TranportistaDbModel.fromRawJson(String str) => TranportistaDbModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TranportistaDbModel.fromJson(Map<String, dynamic> json) => TranportistaDbModel(
        id: json["id"],
        placa: json["placa"],
        nroGuia: json["nroGuia"],
        valor: json["valor"],
        finternet: json["finternet"],
        url: json["url"],
        page: json["page"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "placa": placa,
        "nroGuia": nroGuia,
        "valor": valor,
        "finternet": finternet,
        "url": url,
        "page": page,
    };
}


class TranportistaDbModelResponse {
  final List<TranportistaDbModel> list;

  TranportistaDbModelResponse(this.list);

  factory TranportistaDbModelResponse.fromJson(List<dynamic> parsedJson) {
    List<TranportistaDbModel>  list;
    list = parsedJson.map((i) => TranportistaDbModel.fromJson(i)).toList();

    return TranportistaDbModelResponse(list);
  }
}