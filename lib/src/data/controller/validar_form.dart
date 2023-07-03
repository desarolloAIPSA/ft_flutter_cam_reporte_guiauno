import 'package:flutter/material.dart';
import '../../config/constantes.dart';
import '../functions/validacion_inputs.dart';
import '../models/environment_model.dart';
import '../models/flow_model.dart';
import '../models/option_model.dart';
import '../models/ora/empresa_model.dart';
import '../models/ora/flujo_datos1_model.dart';

class ValidarFormController extends ChangeNotifier {
  Validacioninputs validacioninputs = Validacioninputs();
  
  Future<FlowModel<FlujoDatos1Model>> validar({required EnvironmentModel environ, required FlujoDatos1Model params, required int etapa}) async {
    FlowModel<FlujoDatos1Model> data = FlowModel(mensaje: "Error", estado: false, code: 0, data:ConstProy.dummyRegistro);
    switch (etapa) {
      case 1:
        data = await validacioninputs.validarEtapa1(environ: environ, params: params);
        break;
      case 2:
        data = await validacioninputs.validarEtapa2(environ: environ, params: params);
        break;
      case 3:
        data = await validacioninputs.validarEtapa3(environ: environ, params: params);
        break;
      case 4:
        data = await validacioninputs.validarEtapa4(environ: environ, params: params);
        break;
      default:
    }
    return data;
  }


  Future<FlowModel<FlujoDatos1Model>> guiaSimple({required EnvironmentModel environ, required FlujoDatos1Model params, required int etapa}) async {
    FlowModel<FlujoDatos1Model> data = FlowModel(mensaje: "Error", estado: false, code: 0, data:ConstProy.dummyRegistro);
    //debugPrint('TEST params: ${params.toRawJson()}');
    switch (etapa) {
      case 1:
        data = await validacioninputs.validarEtapa3(environ: environ, params: params);
        break;
      case 2:
        data = await validacioninputs.validarEtapa4(environ: environ, params: params);
        break;
      default:
    }
    return data;
  }


  Future<FlowModel<FlujoDatos1Model>> registroTranportista({required EnvironmentModel environ, required FlujoDatos1Model params}) async => await validacioninputs.registroTranportistaPorQR(environ: environ, params: params);


  Future<List<Option>> listaMaquinaria({required EnvironmentModel environ}) async {
    final respuesta = await validacioninputs.obtenerListaOpcionesMaquinaria(environ: environ);
    List<Option> lista = [];
    for (var element in respuesta.data) {
      Option temporal = maqConvertToOption(element);
      lista.add(temporal);
    }
    return lista;
  }

  Future<List<Option>> listaTipoAlce({required EnvironmentModel environ}) async {
    final respuesta = await validacioninputs.obtenerListaOpcionesTipoAlce(environ: environ);
    List<Option> lista = [];
    for (var element in respuesta.data) {
      Option temporal = tipoConvertToOption(element);
      lista.add(temporal);
    }
    return lista;
  }

  List<Option> listaEmpresa(List<EmpresaOraModel> input) {
    List<Option> lista = [];
    for (var element in input) {
      Option temporal = empresaConvertToOption(element);
      lista.add(temporal);
    }
    return lista;
  }

  String completeLeadingZeros(String input, int max) {
    if (input.length < max) {
      String zeros = '0' * (max - input.length);
      return zeros + input;
    } else {
      return input;
    }
  }
}
