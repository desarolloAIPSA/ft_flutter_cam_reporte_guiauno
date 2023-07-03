// To parse this JSON data, do
//
//     final FlujoDatos1Model = FlujoDatos1ModelFromJson(jsonString);

import 'dart:convert';

class FlujoDatos1Model {
  String tracto;
  String? carreta1;
  String? carreta2;
  String brevete;
  String breveteName;
  String emrpesaTransportista;
  String codEmrpesaTransportista;
  String? transportista;
  String ordenCosecha;
  String? descripcion;
  String? tipAlce;
  String? maquinaria;
  String cantidad;
  String? flagQuema;
  String? fArribo;
  String? fIniAlce;
  String? fFinAlce;
  String? fSalida;
  String? hArribo;
  String? hIniAlce;
  String? hFinAlce;
  String? hSalida;
  double? pesoTara1;
  double? pesoTara2;
  double? pesoTara3;
  String? ppUbigeoPartida;
  String? envModTraslado;
  String? operador;
  String? codOperador;
  String? zzVehpt;
  String? admin;
  String? zona;
  String? frenteCos;
  String? trNroRegMtc;
  String? cpNroDoc;

  FlujoDatos1Model({
    required this.tracto,
    this.carreta1,
    this.carreta2,
    required this.brevete,
    required this.breveteName,
    required this.emrpesaTransportista,
    required this.codEmrpesaTransportista,
    this.transportista,
    required this.ordenCosecha,
    this.descripcion,
    this.tipAlce,
    this.maquinaria,
    required this.cantidad,
    this.flagQuema,
    this.fArribo,
    this.fIniAlce,
    this.fFinAlce,
    this.fSalida,
    this.hArribo,
    this.hIniAlce,
    this.hFinAlce,
    this.hSalida,
    this.pesoTara1,
    this.pesoTara2,
    this.pesoTara3,
    this.ppUbigeoPartida,
    this.envModTraslado,
    this.operador,
    this.codOperador,
    this.zzVehpt,
    this.admin,
    this.zona,
    this.frenteCos,
    this.trNroRegMtc,
    this.cpNroDoc,
  });

  factory FlujoDatos1Model.fromRawJson(String str) => FlujoDatos1Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlujoDatos1Model.fromJson(Map<String, dynamic> json) => FlujoDatos1Model(
        tracto: json["tracto"],
        carreta1: json["carreta1"],
        carreta2: json["carreta2"],
        brevete: json["brevete"],
        breveteName: json["breveteName"],
        emrpesaTransportista: json["emrpesaTransportista"],
        codEmrpesaTransportista: json["codEmrpesaTransportista"],
        transportista: json["transportista"],
        ordenCosecha: json["ordenCosecha"],
        descripcion: json["descripcion"],
        tipAlce: json["tipAlce"],
        maquinaria: json["maquinaria"],
        cantidad: json["cantidad"],
        flagQuema: json["flagQuema"],
        fArribo: json["fArribo"],
        fIniAlce: json["fIniAlce"],
        fFinAlce: json["fFinAlce"],
        fSalida: json["fSalida"],
        hArribo: json["hArribo"],
        hIniAlce: json["hIniAlce"],
        hFinAlce: json["hFinAlce"],
        hSalida: json["hSalida"],
        pesoTara1: json["pesoTara1"],
        pesoTara2: json["pesoTara2"],
        pesoTara3: json["pesoTara3"],
        ppUbigeoPartida: json["ppUbigeoPartida"],
        envModTraslado: json["envModTraslado"],
        operador: json["operador"],
        codOperador: json["codOperador"],
        zzVehpt: json["zzVehpt"],
        admin: json["admin"],
        zona: json["zona"],
        frenteCos: json["frenteCos"],
        trNroRegMtc: json["trNroRegMtc"],
        cpNroDoc: json["cpNroDoc"],
      );

  Map<String, dynamic> toJson() => {
        "tracto": tracto,
        "carreta1": carreta1,
        "carreta2": carreta2,
        "brevete": brevete,
        "breveteName": breveteName,
        "emrpesaTransportista": emrpesaTransportista,
        "codEmrpesaTransportista": codEmrpesaTransportista,
        "transportista": transportista,
        "ordenCosecha": ordenCosecha,
        "descripcion": descripcion,
        "tipAlce": tipAlce,
        "maquinaria": maquinaria,
        "cantidad": cantidad,
        "flagQuema": flagQuema,
        "fArribo": fArribo,
        "fIniAlce": fIniAlce,
        "fFinAlce": fFinAlce,
        "fSalida": fSalida,
        "hArribo": hArribo,
        "hIniAlce": hIniAlce,
        "hFinAlce": hFinAlce,
        "hSalida": hSalida,
        "pesoTara1": pesoTara1,
        "pesoTara2": pesoTara2,
        "pesoTara3": pesoTara3,
        "ppUbigeoPartida": ppUbigeoPartida,
        "envModTraslado": envModTraslado,
        "operador": operador,
        "codOperador": codOperador,
        "zzVehpt": zzVehpt,
        "admin": admin,
        "zona": zona,
        "frenteCos": frenteCos,
        "trNroRegMtc": trNroRegMtc,
        "cpNroDoc": cpNroDoc,
      };

    @override
  String toString() {
    return 'FlujoDatos1Model{'
        'tracto: $tracto, '
        'carreta1: $carreta1, '
        'carreta2: $carreta2, '
        'brevete: $brevete, '
        'breveteName: $breveteName, '
        'emrpesaTransportista: $emrpesaTransportista, '
        'codEmrpesaTransportista: $codEmrpesaTransportista, '
        'transportista: $transportista, '
        'ordenCosecha: $ordenCosecha, '
        'descripcion: $descripcion, '
        'tipAlce: $tipAlce, '
        'maquinaria: $maquinaria, '
        'cantidad: $cantidad, '
        'flagQuema: $flagQuema, '
        'fArribo: $fArribo, '
        'fIniAlce: $fIniAlce, '
        'fFinAlce: $fFinAlce, '
        'fSalida: $fSalida, '
        'hArribo: $hArribo, '
        'hIniAlce: $hIniAlce, '
        'hFinAlce: $hFinAlce, '
        'hSalida: $hSalida, '
        'pesoTara1: $pesoTara1, '
        'pesoTara2: $pesoTara2, '
        'pesoTara3: $pesoTara3, '
        'ppUbigeoPartida: $ppUbigeoPartida, '
        'envModTraslado: $envModTraslado, '
        'operador: $operador, '
        'codOperador: $codOperador, '
        'zzVehpt: $zzVehpt, '
        'admin: $admin, '
        'zona: $zona, '
        'frenteCos: $frenteCos, '
        'trNroRegMtc: $trNroRegMtc'
        'cpNroDoc: $cpNroDoc'
        '}';
  }

  FlujoDatos1Model toReset()=>FlujoDatos1Model(
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
}
