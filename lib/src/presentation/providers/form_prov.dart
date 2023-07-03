import 'package:flutter/material.dart';

import '../../config/constantes.dart';
import '../../data/db/tranportista_db.dart';
import '../../data/models/db/transportista_db_model.dart';
import '../../data/models/flow/qr_read_model.dart';
import '../../data/models/ora/flujo_datos1_model.dart';
import '../../data/models/ora/guia_terminada_c1_model.dart';

class FormProvider with ChangeNotifier {
  GlobalKey<FormState> formKeyRegManual = GlobalKey<FormState>();

  QrMReadModel _qr = ConstProy.dummyQrRead;
  FlujoDatos1Model _formCaseOne = ConstProy.dummyRegistro;
  int guiaSize = 0;
  bool _isLoading = false;
  bool _triggering = false;
  TranportistaDbModel _localGuiSimp = ConstProy.dummyTranportistaDbModel;
  List<TranportistaDbModel> masterTrans = [];
  List<GuiaTermoinadaC1Model> _listTerminado = [];

  cargarTransportistas() async {
    final masterTrans = await TranportistaDb.db.getAll();
    this.masterTrans = [...?masterTrans];
    notifyListeners();
  }

  set listTerminado(List<GuiaTermoinadaC1Model> listTerminado) {
    _listTerminado = listTerminado;
    notifyListeners();
  }

  List<GuiaTermoinadaC1Model> get listTerminado => _listTerminado;

  set qr(QrMReadModel qr) {
    _qr = qr;
    notifyListeners();
  }

  QrMReadModel get qr => _qr;

  set formCaseOne(FlujoDatos1Model formCaseOne) {
    _formCaseOne = formCaseOne;
    notifyListeners();
  }

  FlujoDatos1Model get formCaseOne => _formCaseOne;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set triggering(bool triggering) {
    _triggering = triggering;
    notifyListeners();
  }

  bool get triggering => _triggering;

  set localGuiSimp(TranportistaDbModel localGuiSimp) {
    _localGuiSimp = localGuiSimp;
    notifyListeners();
  }

  TranportistaDbModel get localGuiSimp => _localGuiSimp;
}
