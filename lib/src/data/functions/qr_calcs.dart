import 'dart:convert';

import 'package:reporte_guia/src/config/constantes.dart';
import 'package:reporte_guia/src/data/db/tranportista_db.dart';
import 'package:reporte_guia/src/data/models/flow_model.dart';
import 'package:flutter/material.dart';

import '../models/flow/qr_read_model.dart';
import '../models/ora/flujo_datos1_model.dart';

class QrCalc extends ChangeNotifier {
  iniciar({required String model}) {
    debugPrint('TEST model: $model');
    strToJSON(model: model);
  }

  QrMReadModel strToJSON({required String model}) {
    
    try {
      Map<String, dynamic> qrJson = json.decode(model);
      return QrMReadModel.fromJson(qrJson);
    } catch (e) {
      return ConstProy.dummyQrRead;
    }
  }

  Future<FlowModel<int>> existe({required FlujoDatos1Model input}) async {
    final count = await TranportistaDb.db.conuntByPlaca(input.tracto);
    if (count > 0) {
      return FlowModel(mensaje: 'La placa ${input.tracto} ya fue registrada', estado: false, code: 0, data: count);
    } else {
      return FlowModel(mensaje: 'Registro ', estado: true, code: 0, data: count);
    }
  }
}
