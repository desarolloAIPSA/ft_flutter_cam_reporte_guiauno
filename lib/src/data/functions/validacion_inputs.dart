import 'package:flutter/material.dart';

import '../../config/constantes.dart';
import '../../utils/formatter.dart';
import '../models/api_model.dart';
import '../models/environment_model.dart';
import '../models/flow_model.dart';
import '../models/ora/flujo_datos1_model.dart';
import '../models/sap/maq_alce_model.dart';
import '../models/sap/tipo_alce_model.dart';
import '../services/a_sap_service.dart';

class Validacioninputs extends ChangeNotifier {
  final sapService = SapService();
  final formatterU = FormatterU();

  Future<FlowModel<FlujoDatos1Model>> validarEtapa1({required EnvironmentModel environ, required FlujoDatos1Model params}) async {
    //debugPrint("params: ${params.toRawJson()}");
    if (params.tracto.isNotEmpty) {
      final plaVehi = await sapService.consultarByPlaca(environ, params.tracto);
      if (plaVehi.data.zzplaca != '') {
        params.tracto = plaVehi.data.zzplaca;
        params.emrpesaTransportista = plaVehi.data.name1;
        params.codEmrpesaTransportista = plaVehi.data.stcd1;
        params.envModTraslado = plaVehi.data.descrip;
        params.pesoTara1 = double.parse(plaVehi.data.peso);
        params.zzVehpt = plaVehi.data.zzVehpt;
        params.trNroRegMtc = plaVehi.data.zzcertfVeh;
        params.transportista = plaVehi.data.lifnr;
      } else {
        return FlowModel(mensaje: 'La placa (${params.tracto}) del TRACTO no existe', estado: false, code: 0, data: ConstProy.dummyRegistro);
      }

      if (params.carreta1 != '') {
        final plaTrac1 = await sapService.consultarByPlaca(environ, params.carreta1!);
        if (plaTrac1.data.zzplaca != '') {
          params.carreta1 = plaTrac1.data.zzplaca;
          params.pesoTara2 = double.parse(plaTrac1.data.peso);
        } else {
          return FlowModel(mensaje: 'La placa (${params.carreta1}) de la 1er CARRETA no existe', estado: false, code: 0, data: ConstProy.dummyRegistro);
        }
      }

      if (params.carreta2 != '') {
        final plaTrac2 = await sapService.consultarByPlaca(environ, params.carreta2!);
        if (plaTrac2.data.zzplaca != '') {
          params.carreta2 = plaTrac2.data.zzplaca;
          params.pesoTara3 = double.parse(plaTrac2.data.peso);
        } else {
          return FlowModel(mensaje: 'La placa (${params.carreta2}) del 2da CARRETA no existe', estado: false, code: 0, data: ConstProy.dummyRegistro);
        }
      }

      return FlowModel(mensaje: 'Validación exitosa', estado: true, code: 200, data: params);
    } else {
      return FlowModel(mensaje: 'Ingrese la placa del TRACTO', estado: false, code: 0, data: ConstProy.dummyRegistro);
    }
  }

  Future<FlowModel<FlujoDatos1Model>> validarEtapa2({required EnvironmentModel environ, required FlujoDatos1Model params}) async {
    if (params.brevete.isNotEmpty) {
      final rptBrevete = await sapService.consultarBreveteByZzbrevete(environ, params.brevete);
      if (rptBrevete.data.zzbrevete != '') {
        params.brevete = rptBrevete.data.zzbrevete;
        params.breveteName = rptBrevete.data.zzname;
        params.cpNroDoc = rptBrevete.data.zznumdoc;
      } else {
        return FlowModel(mensaje: 'Brevete ${params.brevete} no encontrado', estado: false, code: 0, data: ConstProy.dummyRegistro);
      }
      return FlowModel(mensaje: 'Validación exitosa', estado: true, code: 200, data: params);
    } else {
      return FlowModel(mensaje: 'Ingrese un brevete', estado: false, code: 0, data: ConstProy.dummyRegistro);
    }
  }

  Future<FlowModel<FlujoDatos1Model>> validarEtapa3({required EnvironmentModel environ, required FlujoDatos1Model params}) async {
    if (params.ordenCosecha.isNotEmpty) {
      final rptOrCo = await sapService.consultarOrdenCosecha(environ, params.ordenCosecha);
      if (rptOrCo.data.zprogCosecha != '') {
        params.descripcion = rptOrCo.data.descrip;
        params.flagQuema = rptOrCo.data.flagQuema;
        params.ppUbigeoPartida = rptOrCo.data.ubigeo;
        params.frenteCos = rptOrCo.data.frenteCos;
        params.admin = rptOrCo.data.admin;
        params.zona = rptOrCo.data.zona;
      } else {
        return FlowModel(mensaje: 'Orden de Cosecha no encontrada', estado: false, code: 0, data: ConstProy.dummyRegistro);
      }
      return FlowModel(mensaje: 'Validación exitosa', estado: true, code: 200, data: params);
    } else {
      return FlowModel(mensaje: 'Ingrese una Orden de Cosecha', estado: false, code: 0, data: ConstProy.dummyRegistro);
    }
  }

  Future<FlowModel<FlujoDatos1Model>> validarEtapa4({required EnvironmentModel environ, required FlujoDatos1Model params}) async {
    //debugPrint("TEST params: ${params.toRawJson()}");
    if (params.tipAlce == null) {
      return FlowModel(mensaje: 'Seleccione un TIPO DE ALCE', estado: false, code: 0, data: ConstProy.dummyRegistro);
    }
    if (params.maquinaria == null) {
      return FlowModel(mensaje: 'Seleccione una MAQUINARIA', estado: false, code: 0, data: ConstProy.dummyRegistro);
    }

    //final comparacion1= formatterU.fechaHora(params.fArribo!, params.hArribo!).compareTo(formatterU.fechaHora(params.fIniAlce!, params.hIniAlce!));
    //if(comparacion1>=0 ){return FlowModel(mensaje: 'El INICIO DE ALCE tiene que ser mayor a la de LLEGADA A CAMPO', estado: false, code: 0, data: ConstProy.dummyRegistro);}
    //
    //final comparacion2= formatterU.fechaHora(params.fIniAlce!, params.hIniAlce!).compareTo(formatterU.fechaHora(params.fFinAlce!, params.hFinAlce!));
    //if(comparacion2>=0 ){return FlowModel(mensaje: 'El FIN DE ALCE tiene que ser mayor a la de INICIO', estado: false, code: 0, data: ConstProy.dummyRegistro);}
    //
    //final comparacion3= formatterU.fechaHora(params.fFinAlce!, params.hFinAlce!).compareTo(formatterU.fechaHora(params.fSalida!, params.hSalida!));
    //if(comparacion3>=0 ){return FlowModel(mensaje: 'La FECHA DE SALIDA tiene que ser mayor a la de FIN DE ALCE', estado: false, code: 0, data: ConstProy.dummyRegistro);}

    if (params.codOperador != '') {
      final askByNroDoc = await sapService.consultarBreveteByNumdoc(environ, params.codOperador!);
      if (askByNroDoc.estado) {
        params.codOperador = askByNroDoc.data.zznumdoc;
        params.operador = askByNroDoc.data.zzname;
        return FlowModel(mensaje: 'Validación exitosa', estado: true, code: 200, data: params);
      } else {
        return FlowModel(mensaje: askByNroDoc.mensaje, estado: false, code: 0, data: ConstProy.dummyRegistro);
      }
    } else {
      return FlowModel(mensaje: 'El DNI del operador no puede estar vacio', estado: false, code: 0, data: ConstProy.dummyRegistro);
    }
  }

  Future<FlowModel<FlujoDatos1Model>> registroTranportistaPorQR({required EnvironmentModel environ, required FlujoDatos1Model params}) async {
    //debugPrint("TEST params: ${params.toRawJson()}");
    final validatePlaca = await validarEtapa1(environ: environ, params: params);
    if (validatePlaca.estado) {
      params = validatePlaca.data;
      final valBrevete = await validarEtapa2(environ: environ, params: params);
      if (valBrevete.estado) {
        params = valBrevete.data;
        return FlowModel(mensaje: 'Validación Exitosa', estado: true, code: 0, data: params);
      } else {
        return FlowModel(mensaje: valBrevete.mensaje, estado: false, code: 0, data: ConstProy.dummyRegistro);
      }
    } else {
      return FlowModel(mensaje: validatePlaca.mensaje, estado: false, code: 0, data: ConstProy.dummyRegistro);
    }
  }

  Future<ApiModel<List<MaquinariaAlceSapModel>>> obtenerListaOpcionesMaquinaria({required EnvironmentModel environ}) async => await sapService.consultarTodasAlzadoras(environ);
  Future<ApiModel<List<TipoAlceSapModel>>> obtenerListaOpcionesTipoAlce({required EnvironmentModel environ}) async => await sapService.consultarTodoTipoAlce(environ);
}
