import 'package:flutter/material.dart';

import '../../db/tranportista_db.dart';
import '../../models/api_model.dart';
import '../../models/db/transportista_db_model.dart';
import '../../models/ora/flujo_datos1_model.dart';

class TranportistaLocalFun extends ChangeNotifier {
  Future<ApiModel<bool>> insertarUno({required FlujoDatos1Model model}) async {
    try {
      await TranportistaDb.db.insertar(TranportistaDbModel(placa: model.tracto, valor: model.toRawJson(), finternet: '0', page: 1));
      return ApiModel(mensaje: 'Registro guardado correctamente', estado: true, code: 200, data: true);
    } catch (e) {
      return ApiModel(mensaje: 'Error $e', estado: false, code: 0, data: false);
    }
  }

  Future<ApiModel<bool>> actualizarPorValorYPagina({required TranportistaDbModel model}) async {
    try {
      await TranportistaDb.db.updateValueAndPage(modelInput: model);
      return ApiModel(mensaje: 'Registro actualizado correctamente', estado: true, code: 200, data: true);
    } catch (e) {
      return ApiModel(mensaje: 'Error $e', estado: false, code: 0, data: false);
    }
  }

  Future<ApiModel<bool>> actualizarPorFlagInternet({required TranportistaDbModel model}) async {
    model.finternet = '1';
    try {
      await TranportistaDb.db.updateFInternet(modelInput: model);
      return ApiModel(mensaje: 'Registro actualizado correctamente', estado: true, code: 200, data: true);
    } catch (e) {
      return ApiModel(mensaje: 'Error $e', estado: false, code: 0, data: false);
    }
  }

  Future<ApiModel<bool>> eliminar() async {
    try {
      await TranportistaDb.db.deleteByFlagInternet('1');
      return ApiModel(mensaje: 'Registro actualizado correctamente', estado: true, code: 200, data: true);
    } catch (e) {
      return ApiModel(mensaje: 'Error $e', estado: false, code: 0, data: false);
    }
  }
}
