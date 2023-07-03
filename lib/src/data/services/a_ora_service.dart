import 'dart:convert';
import 'package:flutter/material.dart';
import '../../config/constantes.dart';
import '../datasources/ora_endpoint.dart';
import '../models/api_model.dart';
import '../models/environment_model.dart';
import '../models/flow/reporte_uno_model.dart';
import '../models/ora/empresa_model.dart';
import '../models/ora/establecimiento_model.dart';
import '../models/ora/guia1_model.dart';
import '../models/ora/guia_terminada_c1_model.dart';
import '../models/ora/lista_params_model.dart';
import '../models/uri_model.dart';
import '../repository/ora_repo.dart';

class OraService extends ChangeNotifier {
  OraReposiroty oraReposiroty = OraReposiroty();

  Future<ApiModel<List<EmpresaOraModel>>> consultarEmpresas(EnvironmentModel input) async {
    input.oraPath = input.oraService + OraEndpoint.listaEmpresa;
    final respuesta = await oraReposiroty.getWithNoQuery(input);
    if (respuesta.statusCode == 200) {
      String decodificadoUtf8 = const Utf8Decoder().convert(respuesta.bodyBytes);
      if (decodificadoUtf8.isNotEmpty) {
        List decodificarToJson = json.decode(decodificadoUtf8);
        List<EmpresaOraModel> dataTemporal = EmpresaOraModelResponse.fromJson(decodificarToJson).list;
        //debugPrint("dataTemporal: ${dataTemporal.toString()}");
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal);
      } else {
        return ApiModel(mensaje: 'No hay registro de Empresas', estado: false, code: 404, data: []);
      }
    } else {
      return ApiModel(mensaje: respuesta.body, estado: false, code: respuesta.statusCode, data: []);
    }
  }

  Future<ApiModel<List<ListaParamsOraModel>>> consultarParametros(EnvironmentModel input) async {
    UriModel parametros = UriModel(queryParameters: {'reporte': 'GRE', 'grupo': 'PARAM'});
    input.oraPath = input.oraService + OraEndpoint.listaParametro;
    final respuesta = await oraReposiroty.getWithQuery(input, parametros);
    if (respuesta.statusCode == 200) {
      String decodificadoUtf8 = const Utf8Decoder().convert(respuesta.bodyBytes);
      if (decodificadoUtf8.isNotEmpty) {
        List decodificarToJson = json.decode(decodificadoUtf8);
        List<ListaParamsOraModel> dataTemporal = ListaParamsOraModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal);
      } else {
        return ApiModel(mensaje: 'No hay registro de Empresas', estado: false, code: 404, data: []);
      }
    } else {
      return ApiModel(mensaje: respuesta.body, estado: false, code: respuesta.statusCode, data: []);
    }
  }

  Future<ApiModel<EstablecimientoOraModel>> consultarEstablecimiento({required EnvironmentModel input, required Map<String, dynamic> queryParams}) async {
    UriModel parametros = UriModel(queryParameters: queryParams);
    input.oraPath = input.oraService + OraEndpoint.obtenerEstablec;
    final respuesta = await oraReposiroty.getWithQuery(input, parametros);
    if (respuesta.statusCode == 200) {
      String decodificadoUtf8 = const Utf8Decoder().convert(respuesta.bodyBytes);
      if (decodificadoUtf8.isNotEmpty) {
        final temporal = EstablecimientoOraModel.fromRawJson(decodificadoUtf8);
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: temporal);
      } else {
        return ApiModel(mensaje: 'No hay registro de Empresas', estado: false, code: 404, data: ConstProy.dummyEstablecimientoOraModel);
      }
    } else {
      return ApiModel(mensaje: 'No hay datos de establecimiento para $queryParams' , estado: false, code: respuesta.statusCode, data: ConstProy.dummyEstablecimientoOraModel);
    }
  }

  Future<ApiModel<Guia1OraModel>> grabar({required EnvironmentModel input, required Guia1OraModel cuerpo, required String zzVehpt, required String frente, required String ruc}) async {
    UriModel parametros = UriModel(queryParameters: {'frente': frente, 'flag': zzVehpt, 'ruc': ruc}, bodyParameters: cuerpo);
    input.oraPath = input.oraService + OraEndpoint.grabarGuia1;
    final respuesta = await oraReposiroty.grabarRegistro(input, parametros);
    if (respuesta.statusCode == 200) {
      String decodificadoUtf8 = const Utf8Decoder().convert(respuesta.bodyBytes);
      final data = Guia1OraModel.fromRawJson(decodificadoUtf8);
      return ApiModel(mensaje: 'Grabado exitoso', estado: true, code: respuesta.statusCode, data: data);
    } else {
      return ApiModel(mensaje: respuesta.body, estado: false, code: respuesta.statusCode, data: ConstProy.dummyGuia1);
    }
  }

  Future<ApiModel<List<GuiaTermoinadaC1Model>>> listGuiaTerminada({required EnvironmentModel input, required Map<String, dynamic> queryParam}) async {
    UriModel parametros = UriModel(queryParameters: queryParam);
    input.oraPath = input.oraService + OraEndpoint.listaGiaFinC1;
    final respuesta = await oraReposiroty.getWithQuery(input, parametros);
    if (respuesta.statusCode == 200) {
      String decodificadoUtf8 = const Utf8Decoder().convert(respuesta.bodyBytes);
      if (decodificadoUtf8.isNotEmpty) {
        List decodificarToJson = json.decode(decodificadoUtf8);
        List<GuiaTermoinadaC1Model> dataTemporal = GuiaTermoinadaC1ModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: 'Coonsulta exitosa', estado: true, code: respuesta.statusCode, data: dataTemporal);
      } else {
        return ApiModel(mensaje: 'No hay registro de Empresas', estado: false, code: 404, data: []);
      }
      /* final data = GuiaTermoinadaC1Model.fromRawJson(decodificadoUtf8);
      return ApiModel(mensaje: 'Grabado exitoso', estado: true, code: respuesta.statusCode, data: data); */
    } else {
      return ApiModel(mensaje: respuesta.body, estado: false, code: respuesta.statusCode, data: []);
    }
  }

  Future<ApiModel<List<Reporte1Model>>> listaReporte({required EnvironmentModel input, required Map<String, dynamic> queryParam}) async {
    UriModel parametros = UriModel(queryParameters: queryParam);
    input.oraPath = input.oraService + OraEndpoint.listaReporteUno;
    final respuesta = await oraReposiroty.getWithQuery(input, parametros);
    if (respuesta.statusCode == 200) {
      String decodificadoUtf8 = const Utf8Decoder().convert(respuesta.bodyBytes);
      if (decodificadoUtf8.isNotEmpty) {
        List decodificarToJson = json.decode(decodificadoUtf8);
        List<Reporte1Model> dataTemporal = Reporte1ModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: 'Coonsulta exitosa', estado: true, code: respuesta.statusCode, data: dataTemporal);
      } else {
        return ApiModel(mensaje: 'No hay registro de Empresas', estado: false, code: 404, data: []);
      }
      /* final data = Reporte1Model.fromRawJson(decodificadoUtf8);
      return ApiModel(mensaje: 'Grabado exitoso', estado: true, code: respuesta.statusCode, data: data); */
    } else {
      return ApiModel(mensaje: respuesta.body, estado: false, code: respuesta.statusCode, data: []);
    }
  }
}
