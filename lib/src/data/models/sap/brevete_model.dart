import 'dart:convert';

class BreveteSapModel {
  String zzbrevete;
  String zzname;
  String? zzfecRev;
  String? zzestadoCho;
  String zznumdoc;

  BreveteSapModel({
    required this.zzbrevete,
    required this.zzname,
    this.zzfecRev,
    this.zzestadoCho,
    required this.zznumdoc,
  });

  factory BreveteSapModel.fromRawJson(String str) => BreveteSapModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BreveteSapModel.fromJson(Map<String, dynamic> json) => BreveteSapModel(
        zzbrevete: json["Zzbrevete"],
        zzname: json["Zzname"],
        zzfecRev: json["ZzfecRev"],
        zzestadoCho: json["ZzestadoCho"],
        zznumdoc: json["Zznumdoc"],
      );

  Map<String, dynamic> toJson() => {
        "Zzbrevete": zzbrevete,
        "Zzname": zzname,
        "ZzfecRev": zzfecRev,
        "ZzestadoCho": zzestadoCho,
        "Zznumdoc": zznumdoc,
      };
}

class BreveteSapModelResponse {
  final List<BreveteSapModel> list;

  BreveteSapModelResponse(this.list);

  factory BreveteSapModelResponse.fromJson(List<dynamic> parsedJson) {
    List<BreveteSapModel> list;
    list = parsedJson.map((i) => BreveteSapModel.fromJson(i)).toList();

    return BreveteSapModelResponse(list);
  }
}
