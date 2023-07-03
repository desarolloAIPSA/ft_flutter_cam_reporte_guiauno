import 'dart:convert';

import 'package:reporte_guia/src/data/models/uri_model.dart';
import 'package:reporte_guia/src/domain/entities/login_model.dart';

import '../../domain/entities/a_auth_model.dart';
import '../../domain/repository/auth_repo.dart';
import '../datasources/ora_endpoint.dart';
import '../models/api_model.dart';
import '../models/environment_model.dart';
import 'ora_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final OraReposiroty _oraReposiroty = OraReposiroty();
  AuthModel dummy = AuthModel(estado: false, user: '', nombre: '',nrodoc: '');
  @override
  Future<ApiModel<AuthModel>> login(EnvironmentModel input, LoginModel model) async {
    input.oraPath = input.authService + OraEndpoint.authentication;
    final respuesta = await _oraReposiroty.getWithQuery(input, UriModel(queryParameters: {'user': model.usuario, 'passwd': model.password, 'grupo': model.grupo}));
    if (respuesta.statusCode == 200) {
      String decodificadoUtf8 = const Utf8Decoder().convert(respuesta.bodyBytes);
      final data = AuthModel.fromRawJson(decodificadoUtf8);
      if(data.estado){
        return ApiModel(mensaje: "Bienvenido ${data.nombre}", estado: true,code: respuesta.statusCode, data: data);
      }else{
        return ApiModel(mensaje: "Usuario y/o contarseña incorrectos ${model.usuario}", estado: false,code: respuesta.statusCode, data: data);
      }
    } else {
      return ApiModel(mensaje: "Se obtuvo un error", estado: false, code: respuesta.statusCode, data: dummy);
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  // Implementación de los métodos de AuthRepository
}
