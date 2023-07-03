import 'package:flutter/material.dart';

import '../models/ora/lista_params_model.dart';
import '../models/ora/parametro_model.dart';

class ParameterTable extends ChangeNotifier {

  ParametroCase1OraModel setParametersCaso1({required List<ListaParamsOraModel> listParametros}) {
    ParametroCase1OraModel parametroOraModel = ParametroCase1OraModel(
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
        biCodBien: '');

    for (var element in listParametros) {
      parametroOraModel = selector(element, parametroOraModel);
    }
    //debugPrint("parametroOraModel: ${parametroOraModel.toRawJson()}");
    return parametroOraModel;
  }

  ParametroCase1OraModel selector(ListaParamsOraModel listParametros, ParametroCase1OraModel salida) {
    switch (listParametros.descripcion) {
      case "GR_VERSION_UBL":
        salida.grVersionUbl = listParametros.cosValorDato!;
        break;
      case "GR_VERSION_DOC":
        salida.grVersionDoc = listParametros.cosValorDato!;
        break;
      case "TIPO_DOC_RUC":
        salida.tipoDocRuc = listParametros.cosValorDato!;
        break;
      case "DE_TIPO_DOC":
        salida.deTipoDoc = listParametros.cosValorDato!;
        break;
      case "DE_NRO_DOC":
        salida.deNroDoc = listParametros.cosValorDato!;
        break;
      case "DE_RAZON_SOCIAL":
        salida.deRazonSocial = listParametros.cosValorDato!;
        break;
      case "UND_TON":
        salida.undTon = listParametros.cosValorDato!;
        break;
      case "PLL_UBIGEO_LLEGADA":
        salida.pllUbigeoLlegada = listParametros.cosValorDato!;
        break;
      case "PLL_DIRECCION":
        salida.pllDireccion = listParametros.cosValorDato!;
        break;
      case "PLL_COD_ESTABLECIMIENTO":
        salida.pllCodEstablecimiento = listParametros.cosValorDato!;
        break;
      case "BI_DESC_BIEN":
        salida.biDescBien = listParametros.cosValorDato!;
        break;
      case "BI_COD_BIEN":
        salida.biCodBien = listParametros.cosValorDato ?? '';
        break;
      default:
    }
    return salida;
  }
}
