import 'dart:convert';

import 'package:reporte_guia/src/data/models/api_model.dart';
import 'package:flutter/material.dart';

import '../../config/constantes.dart';
import '../datasources/sap_endpoint.dart';
import '../models/environment_model.dart';
import '../models/sap/brevete_model.dart';
import '../models/sap/maq_alce_model.dart';
import '../models/sap/orden_cose_model.dart';
import '../models/sap/placa_sap_model.dart';
import '../models/sap/tipo_alce_model.dart';
import '../models/uri_model.dart';
import '../repository/sap_repo.dart';

class SapService extends ChangeNotifier {
  SapReposiroty sapReposiroty = SapReposiroty();
  
  List<MaquinariaAlceSapModel> dummy4 = [];
  List<TipoAlceSapModel> dummy5 = [];

  
  Future<ApiModel<PlacaSapModel>> consultarByPlaca(EnvironmentModel input, String placa) async {
    UriModel parametros = UriModel(queryParameters: {'\$format': 'json', '\$filter': "Zzplaca eq '$placa'"});
    input.sapPath = input.sapService + SapEndpoint.getVehiculo;
    final respuesta = await sapReposiroty.getRegister(input, parametros);
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> decode = json.decode(respuesta.body);
      String texto = json.encode(decode["d"]["results"]);
      List decodificarToJson = json.decode(texto);
      if (decodificarToJson.isNotEmpty) {
        List<PlacaSapModel> dataTemporal = PlacaSapModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal[0]);
      } else {
        return ApiModel(mensaje: 'Placa no registrada', estado: false, code: 404, data: ConstProy.dummyPlacaSap);
      }
    } else {
      return ApiModel(mensaje: '', estado: false, code: respuesta.statusCode, data: ConstProy.dummyPlacaSap);
    }
  }

  Future<ApiModel<BreveteSapModel>> consultarBreveteByZzbrevete(EnvironmentModel input, String brevete) async {
    UriModel parametros = UriModel(queryParameters: {'\$format': 'json', '\$filter': "Zzbrevete eq '$brevete'"});
    input.sapPath = input.sapService + SapEndpoint.getChofer;
    final respuesta = await sapReposiroty.getRegister(input, parametros);
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> decode = json.decode(respuesta.body);
      String texto = json.encode(decode["d"]["results"]);
      List decodificarToJson = json.decode(texto);
      if (decodificarToJson.isNotEmpty) {
        List<BreveteSapModel> dataTemporal = BreveteSapModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal[0]);
      } else {
        return ApiModel(mensaje: 'Brevete no registrado en BD', estado: false, code: 404, data: ConstProy.dummyBrevete);
      }
    } else {
      return ApiModel(mensaje: '', estado: false, code: respuesta.statusCode, data: ConstProy.dummyBrevete);
    }
  }


  Future<ApiModel<BreveteSapModel>> consultarBreveteByNumdoc(EnvironmentModel input, String nroDoc) async {
    UriModel parametros = UriModel(queryParameters: {'\$format': 'json', '\$filter': "Zznumdoc  eq '$nroDoc'"});
    input.sapPath = input.sapService + SapEndpoint.getChofer;
    final respuesta = await sapReposiroty.getRegister(input, parametros);
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> decode = json.decode(respuesta.body);
      String texto = json.encode(decode["d"]["results"]);
      List decodificarToJson = json.decode(texto);
      if (decodificarToJson.isNotEmpty) {
        List<BreveteSapModel> dataTemporal = BreveteSapModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal[0]);
      } else {
        return ApiModel(mensaje: 'DNI ($nroDoc) no registrado en BD', estado: false, code: 404, data: ConstProy.dummyBrevete);
      }
    } else {
      return ApiModel(mensaje: '', estado: false, code: respuesta.statusCode, data: ConstProy.dummyBrevete);
    }
  }

  Future<ApiModel<OrdCosSapModel>> consultarOrdenCosecha(EnvironmentModel input, String orCosecha) async {
    UriModel parametros = UriModel(queryParameters: {'\$format': 'json', '\$filter': "ZprogCosecha eq '$orCosecha'"});
    input.sapPath = input.sapService + SapEndpoint.getOrdencosecha;
    final respuesta = await sapReposiroty.getRegister(input, parametros);
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> decode = json.decode(respuesta.body);
      String texto = json.encode(decode["d"]["results"]);
      List decodificarToJson = json.decode(texto);
      if (decodificarToJson.isNotEmpty) {
        List<OrdCosSapModel> dataTemporal = OrdCosSapModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal[0]);
      } else {
        return ApiModel(mensaje: 'Orden de cosecha no registrada en BD', estado: false, code: 404, data: ConstProy.dummyOrdCosSap);
      }
    } else {
      return ApiModel(mensaje: '', estado: false, code: respuesta.statusCode, data: ConstProy.dummyOrdCosSap);
    }
  }

  Future<ApiModel<List<MaquinariaAlceSapModel>>> consultarTodasAlzadoras(EnvironmentModel input) async {
    UriModel parametros = UriModel(queryParameters: {'\$format': 'json'});
    input.sapPath = input.sapService + SapEndpoint.getAlzadora;
    final respuesta = await sapReposiroty.getRegister(input, parametros);
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> decode = json.decode(respuesta.body);
      String texto = json.encode(decode["d"]["results"]);
      List decodificarToJson = json.decode(texto);
      if (decodificarToJson.isNotEmpty) {
        List<MaquinariaAlceSapModel> dataTemporal = MaquinariaAlceSapModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal);
      } else {
        return ApiModel(mensaje: 'No hay opciones de Maquinarias', estado: false, code: 404, data: dummy4);
      }
    } else {
      return ApiModel(mensaje: '', estado: false, code: respuesta.statusCode, data: dummy4);
    }
  }

  Future<ApiModel<List<TipoAlceSapModel>>> consultarTodoTipoAlce(EnvironmentModel input) async {
    UriModel parametros = UriModel(queryParameters: {'\$format': 'json'});
    input.sapPath = input.sapService + SapEndpoint.getTipoalce;
    final respuesta = await sapReposiroty.getRegister(input, parametros);
    if (respuesta.statusCode == 200) {
      Map<String, dynamic> decode = json.decode(respuesta.body);
      String texto = json.encode(decode["d"]["results"]);
      List decodificarToJson = json.decode(texto);
      if (decodificarToJson.isNotEmpty) {
        List<TipoAlceSapModel> dataTemporal = TipoAlceSapModelResponse.fromJson(decodificarToJson).list;
        return ApiModel(mensaje: '', estado: true, code: respuesta.statusCode, data: dataTemporal);
      } else {
        return ApiModel(mensaje: 'Orden de cosecha no registrada en BD', estado: false, code: 404, data: dummy5);
      }
    } else {
      return ApiModel(mensaje: '', estado: false, code: respuesta.statusCode, data: dummy5);
    }
  }
}
