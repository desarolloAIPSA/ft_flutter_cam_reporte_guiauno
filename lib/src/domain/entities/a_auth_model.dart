// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

class AuthModel {
    AuthModel({
        required this.estado,
        required this.user,
        required this.nombre,
        this.nrodoc,
        this.tipodoc,
    });

    bool estado;
    String user;
    String nombre;
    String? nrodoc;
    String? tipodoc;

    factory AuthModel.fromRawJson(String str) => AuthModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        estado: json["estado"],
        user: json["user"],
        nombre: json["nombre"],
        nrodoc: json["nrodoc"],
        tipodoc: json["tipodoc"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "user": user,
        "nombre": nombre,
        "nrodoc": nrodoc,
        "tipodoc": tipodoc,
    };

    @override
    String toString() {
      return 'AuthModel { estado: $estado, user: $user, nombre: $nombre }';
    }
}


class AuthModelResponse {
  final List<AuthModel> list;

  AuthModelResponse(
    this.list
    );

  factory AuthModelResponse.fromJson(List<dynamic> parsedJson) {
    List<AuthModel> list;
    list = parsedJson.map((i) => AuthModel.fromJson(i)).toList();

    return AuthModelResponse(list);
  }
}