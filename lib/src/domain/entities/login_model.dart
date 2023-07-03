// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'dart:convert';
import 'package:reporte_guia/src/data/models/option_model.dart';
import 'package:equatable/equatable.dart';


class LoginModel extends Equatable {
  LoginModel({
    required this.empresa,
    required this.usuario,
    required this.password,
    required this.recordar,
    required this.grupo,
  });

  Option empresa;
  String usuario;
  String password;
  String grupo;
  bool recordar;

  factory LoginModel.fromRawJson(String str) =>LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        empresa: Option.fromJson(json["empresa"]),
        usuario: json["usuario"],
        password: json["password"],
        grupo: json["grupo"],
        recordar: json["recordar"],
      );

  Map<String, dynamic> toJson() => {
        "empresa": empresa.toJson(),
        "usuario": usuario,
        "password": password,
        "grupo": grupo,
        "recordar": recordar,
      };

  @override
  List<Object?> get props => [empresa, usuario, password, recordar];
}
