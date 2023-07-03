
import 'dart:convert';

class EnvironmentModel {
  String oraDomain;
  String sapDomain;
  String oraService;
  String sapService;
  String authService;
  String entidad;
  String sapPath = '';
  String oraPath = '';
  String user;
  String password;
  String basicAuth = '';

  EnvironmentModel({
    required this.oraDomain,
    required this.sapDomain,
    required this.oraService,
    required this.sapService,
    required this.authService,
    required this.sapPath,
    required this.oraPath,
    required this.user,
    required this.password,
    required this.entidad,
  }) {
    basicAuth = 'Basic ${base64Encode(utf8.encode('$user:$password'))}';
  }

  factory EnvironmentModel.fromRawJson(String str) => EnvironmentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) => EnvironmentModel(
        oraDomain: json["OraDomain"],
        sapDomain: json["SapDomain"],
        oraService: json["OraService"],
        sapService: json["SapService"],
        authService: json["authService"],
        sapPath: json["sapPath"],
        oraPath: json["oraPath"],
        user: json["user"],
        password: json["password"],
        entidad: json["entidad"],
      );

  Map<String, dynamic> toJson() => {
        "OraDomain": oraDomain,
        "SapDomain": sapDomain,
        "OraService": oraService,
        "SapService": sapService,
        "authService": authService,
        "sapPath": sapPath,
        "oraPath": oraPath,
        "user": user,
        "password": password,
        "entidad": entidad,
      };

  @override
  String toString() {
    return 'EnvironmentModel {'
        '\n  oraDomain: $oraDomain,'
        '\n  sapDomain: $sapDomain,'
        '\n  oraService: $oraService,'
        '\n  sapService: $sapService,'
        '\n  authService: $authService,'
        '\n  sapPath: $sapPath,'
        '\n  oraPath: $oraPath,'
        '\n  user: $user,'
        '\n  password: $password,'
        '\n  basicAuth: $basicAuth'
        '\n  entidad: $entidad'
        '\n}';
  }
}
