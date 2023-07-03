import 'package:flutter/material.dart';

import '../../data/models/ora/parametro_model.dart';

class CasosProv with ChangeNotifier {
  ParametroCase1OraModel _paramCase1 = ParametroCase1OraModel(
      grVersionUbl: '',
      grVersionDoc: '',
      tipoDocRuc: '',
      deTipoDoc: '',
      deNroDoc: '',
      deRazonSocial: '',
      undTon: '',
      pllUbigeoLlegada: '',
      pllDireccion: '',
      pllCodEstablecimiento: '',
      biDescBien: '',
      biCodBien: ''
    );

  set paramCase1(ParametroCase1OraModel paramCase1) {
    _paramCase1 = paramCase1;
    notifyListeners();
  }

  ParametroCase1OraModel get paramCase1 => _paramCase1;
}
