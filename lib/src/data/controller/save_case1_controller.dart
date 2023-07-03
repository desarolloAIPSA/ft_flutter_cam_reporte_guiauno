import 'package:flutter/material.dart';
import '../../config/constantes.dart';
import '../../domain/entities/a_auth_model.dart';
import '../../utils/formatter.dart';
import '../models/api_model.dart';
import '../models/environment_model.dart';
import '../models/ora/empresa_model.dart';
import '../models/ora/establecimiento_model.dart';
import '../models/ora/guia1_model.dart';
import '../models/ora/parametro_model.dart';
import '../models/ora/flujo_datos1_model.dart';
import '../services/a_ora_service.dart';

class SaveCase1Con extends ChangeNotifier {
  FormatterU formatterU = FormatterU();
  OraService oraService = OraService();
  Future<ApiModel<Guia1OraModel>> guardar(
      {required EnvironmentModel input, required FlujoDatos1Model params, required EmpresaOraModel empresa, required ParametroCase1OraModel paramsTable, required AuthModel auth}) async {
    final establecimiento = await oraService.consultarEstablecimiento(input: input, queryParams: {'admin': params.admin, 'ruc': empresa.ruc,'zona': params.zona});
    if (establecimiento.estado) {
      if(params.zzVehpt=='P'){
        Guia1OraModel armadoJSON = armarJsonPropio(params: params, empresa: empresa, paramsTable: paramsTable, auth: auth,establecimiento: establecimiento.data);
        final respuesta = await oraService.grabar(input: input, cuerpo: armadoJSON, zzVehpt: params.zzVehpt!, frente: params.frenteCos!, ruc: empresa.ruc);
        debugPrint("TEST respuesta: ${respuesta.toRawJson()}");
        return respuesta;
      }else{
        Guia1OraModel armadoJSON = armarJsonTercero(params: params, empresa: empresa, paramsTable: paramsTable, auth: auth,establecimiento: establecimiento.data );
        final respuesta = await oraService.grabar(input: input, cuerpo: armadoJSON, zzVehpt: params.zzVehpt!, frente: params.frenteCos!, ruc: empresa.ruc);
        debugPrint("TEST respuesta: ${respuesta.toRawJson()}");
        return respuesta;
      }   
    } else {
      return ApiModel(mensaje: establecimiento.mensaje, estado: false, code: 0, data: ConstProy.dummyGuia1);
    }
  }

  Guia1OraModel armarJsonTercero({required FlujoDatos1Model params, required EmpresaOraModel empresa, required ParametroCase1OraModel paramsTable, required AuthModel auth, required EstablecimientoOraModel establecimiento}) {
    List<String> fechActual = formatterU.actual();
    return Guia1OraModel(
      biCantidad: double.parse(params.cantidad),
      biCodBien: paramsTable.biCodBien,
      biDescBien: paramsTable.biDescBien,
      biUnd: paramsTable.undTon,
      deNroDoc: empresa.ruc,
      deRazonSocial: paramsTable.deRazonSocial,
      deTipoDoc: paramsTable.deTipoDoc,
      envDescMotTraslado: empresa.descMotTraslado,
      envFecEntregaAlTransp: fechActual[0],
      envFecIniTraslado: fechActual[0],
      envModTraslado: params.envModTraslado!,
      envMotivoTraslado: empresa.codMotTraslado.trim(),
      envPesoBruto: double.parse(params.cantidad) + (params.pesoTara1 ?? 0) + (params.pesoTara2 ?? 0) + (params.pesoTara3 ?? 0),
      envPesoNeto: double.parse(params.cantidad),
      envUndPesoBruto: paramsTable.undTon,
      envUndPesoNeto: paramsTable.undTon,
      grFecEmision: fechActual[0],
      grHoraEmision: fechActual[1],
      //grNroGuia: 'T001-3',
      grVersionDoc: paramsTable.grVersionDoc,
      grVersionUbl: paramsTable.grVersionUbl,
      brevete: params.brevete,
      fecArriboCampo: formatterU.fecHorStrToORA(params.fArribo!, params.hArribo!),
      fecFinAlce: formatterU.fecHorStrToORA(params.fFinAlce!, params.hFinAlce!),
      fecIniAlce: formatterU.fecHorStrToORA(params.fIniAlce!, params.hIniAlce!),
      fecSalidaCampo: formatterU.fecHorStrToORA(params.fSalida!, params.hSalida!),
      flagQuema: params.flagQuema!,
      maqAlce: params.maquinaria!,
      nroOrdenCosecha: params.ordenCosecha,
      //nroRegistroSap: auth.nrodoc,
      operador: params.operador!,
      placa1: params.tracto,
      placa2: params.carreta1,
      placa3: params.carreta2,
      pllDireccion: paramsTable.pllDireccion,
      pllUbigeoLlegada: paramsTable.pllUbigeoLlegada,
      ppDireccion: params.descripcion!,
      ppUbigeoPartida: establecimiento.ubigeo,
      reNroDoc: empresa.ruc,
      reRazonSocial: empresa.nombre,
      tipoAlce: params.tipAlce!,
      trNroDoc: params.codEmrpesaTransportista,
      trRazonSocial: params.emrpesaTransportista,
      reTipoDoc: paramsTable.tipoDocRuc,
      pllCodEstablecimiento: empresa.establecLlegada.trim(),
      ppCodEstablecimiento: establecimiento.establecimiento,
      trTipoDoc: paramsTable.tipoDocRuc,
      trNroRegMtc: params.trNroRegMtc,
      operadorSap:auth.nrodoc!,
      //operadorSap:'40403412',
      transportista:params.transportista!,
      frenteCosecha:params.frenteCos!,
      codOperador: params.codOperador!,
      pllNroRuc: empresa.ruc,
      ppNroRuc: empresa.ruc,
      //cpTipoConductor:'Principal',
      //cpTipoDoc:'1',
      //cpNroDoc:params.cpNroDoc!,
      //cpApellidosNombres:params.breveteName,
      //cpLicenciaConducir:params.brevete,
      nomTransportista: params.breveteName
    );
    //debugPrint(" jsonObject: ${jsonObject.toRawJson()}");
    //return jsonObject;
  }


  Guia1OraModel armarJsonPropio({required FlujoDatos1Model params, required EmpresaOraModel empresa, required ParametroCase1OraModel paramsTable, required AuthModel auth, required EstablecimientoOraModel establecimiento}) {
    List<String> fechActual = formatterU.actual();

    return Guia1OraModel(
      biCantidad: double.parse(params.cantidad),
      biCodBien: paramsTable.biCodBien,
      biDescBien: paramsTable.biDescBien,
      biUnd: paramsTable.undTon,
      deNroDoc: empresa.ruc,
      deRazonSocial: paramsTable.deRazonSocial,
      deTipoDoc: paramsTable.deTipoDoc,
      envDescMotTraslado: empresa.descMotTraslado,
      envFecEntregaAlTransp: fechActual[0],
      envFecIniTraslado: fechActual[0],
      envModTraslado: params.envModTraslado!,
      envMotivoTraslado: empresa.codMotTraslado.trim(),
      envPesoBruto: double.parse(params.cantidad) + (params.pesoTara1 ?? 0) + (params.pesoTara2 ?? 0) + (params.pesoTara3 ?? 0),
      envPesoNeto: double.parse(params.cantidad),
      envUndPesoBruto: paramsTable.undTon,
      envUndPesoNeto: paramsTable.undTon,
      grFecEmision: fechActual[0],
      grHoraEmision: fechActual[1],
      //grNroGuia: 'T001-3',
      grVersionDoc: paramsTable.grVersionDoc,
      grVersionUbl: paramsTable.grVersionUbl,
      brevete: params.brevete,
      fecArriboCampo: formatterU.fecHorStrToORA(params.fArribo!, params.hArribo!),
      fecFinAlce: formatterU.fecHorStrToORA(params.fFinAlce!, params.hFinAlce!),
      fecIniAlce: formatterU.fecHorStrToORA(params.fIniAlce!, params.hIniAlce!),
      fecSalidaCampo: formatterU.fecHorStrToORA(params.fSalida!, params.hSalida!),
      flagQuema: params.flagQuema!,
      maqAlce: params.maquinaria!,
      nroOrdenCosecha: params.ordenCosecha,
      //nroRegistroSap: auth.nrodoc,
      operador: params.operador!,
      placa1: params.tracto,
      placa2: params.carreta1,
      placa3: params.carreta2,
      pllDireccion: paramsTable.pllDireccion,
      pllUbigeoLlegada: paramsTable.pllUbigeoLlegada,
      ppDireccion: params.descripcion!,
      ppUbigeoPartida: establecimiento.ubigeo,
      reNroDoc: empresa.ruc,
      reRazonSocial: empresa.nombre,
      tipoAlce: params.tipAlce!,
      reTipoDoc: paramsTable.tipoDocRuc,
      pllCodEstablecimiento: empresa.establecLlegada.trim(),
      ppCodEstablecimiento: establecimiento.establecimiento,
      //trNroDoc: params.codEmrpesaTransportista,
      //trRazonSocial: params.emrpesaTransportista,
      //trTipoDoc: paramsTable.tipoDocRuc,
      //trNroRegMtc: ,
      veNroPlaca: params.tracto,
      caNroPlaca1: params.carreta1,
      caNroPlaca2: params.carreta2,
      operadorSap:auth.nrodoc!,
      transportista:params.transportista!,
      frenteCosecha:params.frenteCos!,
      codOperador: params.codOperador!,
      pllNroRuc: empresa.ruc,
      ppNroRuc: empresa.ruc,
      cpTipoConductor:'Principal',
      cpTipoDoc:'1',
      cpNroDoc:params.cpNroDoc!,
      cpApellidosNombres:params.breveteName,
      cpLicenciaConducir:params.brevete,
      nomTransportista: params.breveteName
    );
    //debugPrint(" jsonObject: ${jsonObject.toRawJson()}");
    //return jsonObject;
  }
}
