// To parse this JSON data, do
//
//     final placaSapModel = placaSapModelFromJson(jsonString);

import 'dart:convert';

class PlacaSapModel {
  String zzplaca;
  String lifnr;
  String zzTpveh;
  String descrip;
  String zzestadoVeh;
  String name1;
  String stcd1;
  String peso;
  String? zzcertfVeh;
  String zzVehpt;

  PlacaSapModel({
    required this.zzplaca,
    required this.lifnr,
    required this.zzTpveh,
    required this.descrip,
    required this.zzestadoVeh,
    required this.name1,
    required this.stcd1,
    required this.peso,
    this.zzcertfVeh,
    required this.zzVehpt,
  });

  factory PlacaSapModel.fromRawJson(String str) => PlacaSapModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlacaSapModel.fromJson(Map<String, dynamic> json) => PlacaSapModel(
        zzplaca: json["Zzplaca"],
        lifnr: json["Lifnr"],
        zzTpveh: json["ZzTpveh"],
        descrip: json["Descrip"],
        zzestadoVeh: json["ZzestadoVeh"],
        name1: json["Name1"],
        stcd1: json["Stcd1"],
        peso: json["Peso"],
        zzcertfVeh: json["ZzcertfVeh"],
        zzVehpt: json["ZzVehpt"],
      );

  Map<String, dynamic> toJson() => {
        "Zzplaca": zzplaca,
        "Lifnr": lifnr,
        "Descrip": descrip,
        "ZzTpveh": zzTpveh,
        "ZzestadoVeh": zzestadoVeh,
        "Name1": name1,
        "Stcd1": stcd1,
        "Peso": peso,
        "ZzcertfVeh": zzcertfVeh,
        "ZzVehpt": zzcertfVeh,
      };
}

class PlacaSapModelResponse {
  final List<PlacaSapModel> list;

  PlacaSapModelResponse(this.list);

  factory PlacaSapModelResponse.fromJson(List<dynamic> parsedJson) {
    List<PlacaSapModel> list;
    list = parsedJson.map((i) => PlacaSapModel.fromJson(i)).toList();

    return PlacaSapModelResponse(list);
  }
}
