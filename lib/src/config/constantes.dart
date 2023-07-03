import 'package:reporte_guia/src/data/models/db/transportista_db_model.dart';
import 'package:reporte_guia/src/data/models/ora/establecimiento_model.dart';
import 'package:reporte_guia/src/data/models/ora/guia_terminada_c1_model.dart';

import '../data/models/flow/qr_read_model.dart';
import '../data/models/ora/guia1_model.dart';
import '../data/models/ora/lista_params_model.dart';
import '../data/models/ora/flujo_datos1_model.dart';
import '../data/models/sap/brevete_model.dart';
import '../data/models/sap/orden_cose_model.dart';
import '../data/models/sap/placa_sap_model.dart';

class ConstProy {
  ConstProy._();

  static Guia1OraModel dummyGuia1 = Guia1OraModel(
      biCantidad: 0,
      biCodBien: '',
      biDescBien: '',
      biUnd: '',
      deNroDoc: '',
      deRazonSocial: '',
      deTipoDoc: '',
      envDescMotTraslado: '',
      envFecEntregaAlTransp: '',
      envFecIniTraslado: '',
      envModTraslado: '',
      envMotivoTraslado: '',
      envPesoBruto: 0,
      envPesoNeto: 0,
      envUndPesoBruto: '',
      envUndPesoNeto: '',
      grFecEmision: '',
      grHoraEmision: '',
      //grNroGuia: '',
      grVersionDoc: '',
      grVersionUbl: '',
      brevete: '',
      fecArriboCampo: '',
      fecFinAlce: '',
      fecIniAlce: '',
      fecSalidaCampo: '',
      flagQuema: '',
      maqAlce: '',
      nroOrdenCosecha: '',
      //nroRegistroSap: '',
      operador: '',
      placa1: '',
      pllDireccion: '',
      pllUbigeoLlegada: '',
      ppDireccion: '',
      ppUbigeoPartida: '',
      reNroDoc: '',
      reRazonSocial: '',
      tipoAlce: '',
      reTipoDoc: '',
      pllCodEstablecimiento: '',
      ppCodEstablecimiento: '',
      operadorSap: '',
      transportista: '',
      frenteCosecha: '',
      codOperador: '',
      pllNroRuc: '',
      ppNroRuc: '',
      nomTransportista: '',
      );

  static final dummyListaParamsOra = ListaParamsOraModel(reporte: '', grupo: '', subgrupo: '', descripcion: '', cosValorDato: '');
  static final dummyPlacaSap = PlacaSapModel(zzplaca: "", lifnr: '', zzTpveh: '', zzestadoVeh: '', name1: '', stcd1: '', peso: '', descrip: '', zzVehpt: '');
  static final dummyRegistro = FlujoDatos1Model(
      tracto: '',
      carreta1: '',
      carreta2: '',
      brevete: '',
      emrpesaTransportista: '',
      ordenCosecha: '',
      codEmrpesaTransportista: '',
      breveteName: '',
      cantidad: "",
      envModTraslado: '',
      operador: '',
      ppUbigeoPartida: '',
      codOperador: '15845893',
      zzVehpt: '',
      frenteCos: '',
      maquinaria: '',
      descripcion: '',
      cpNroDoc: ''
      );
  static final dummyOrdCosSap =
      OrdCosSapModel(zprogCosecha: '', ztpcorte: '', status: '', proyecto: '', admin: '', zona: '', campo: '', quiebre: '', descrip: '', ubigeo: '', flagQuema: '', frenteCos: '');
  static final dummyQrRead = QrMReadModel(tracto: '', dni: '', brevete: '', cantidad: '');
  static final dummyBrevete = BreveteSapModel(zzbrevete: '', zzname: '', zzfecRev: '', zzestadoCho: '', zznumdoc: '');
  static final dummyTranportistaDbModel = TranportistaDbModel(placa: '', valor: '');
  static final dummyGuiaTermoinadaC1Model = GuiaTermoinadaC1Model(grNroGuia: '', reNroDoc: '', placa1: '', grFecEmision: '', grHoraEmision: '', operadorSap: '', trRazonSocial: '',nomTransportista: '');
  static final dummyEstablecimientoOraModel = EstablecimientoOraModel( establecimiento: '', ubigeo: '');
}
