// To parse this JSON data, do
//
//     final guia1OraModel = guia1OraModelFromJson(jsonString);

import 'dart:convert';

class Guia1OraModel {
  double biCantidad;
  String biCodBien;
  String biDescBien;
  String biUnd;
  String deNroDoc;
  String deRazonSocial;
  String deTipoDoc;
  String envDescMotTraslado;
  String envFecEntregaAlTransp;
  String envFecIniTraslado;
  String envModTraslado;
  String envMotivoTraslado;
  double envPesoBruto;
  double envPesoNeto;
  String envUndPesoBruto;
  String envUndPesoNeto;
  String grFecEmision;
  String grHoraEmision;
  String? grNroGuia;
  String grVersionDoc;
  String grVersionUbl;
  String brevete;
  String fecArriboCampo;
  String fecFinAlce;
  String fecIniAlce;
  String fecSalidaCampo;
  String flagQuema;
  String maqAlce;
  String nroOrdenCosecha;
  //String nroRegistroSap;
  String operador;
  String placa1;
  String? placa2;
  String? placa3;
  String pllDireccion;
  String pllUbigeoLlegada;
  String ppDireccion;
  String ppUbigeoPartida;
  String reNroDoc;
  String reRazonSocial;
  String tipoAlce;
  String reTipoDoc;
  String ppCodEstablecimiento;
  String pllCodEstablecimiento;
  String? trTipoDoc;
  String? trNroDoc;
  String? trRazonSocial;
  String? trNroRegMtc;
  String? veNroPlaca;
  String? caNroPlaca1;
  String? caNroPlaca2;
  String operadorSap;
  String transportista;
  String frenteCosecha;
  String codOperador;
  String ppNroRuc;
  String pllNroRuc;

  String? cpTipoConductor;
  String? cpTipoDoc;
  String? cpNroDoc;
  String? cpApellidosNombres;
  String? cpLicenciaConducir;
  String nomTransportista;

  Guia1OraModel({
    required this.biCantidad,
    required this.biCodBien,
    required this.biDescBien,
    required this.biUnd,
    required this.deNroDoc,
    required this.deRazonSocial,
    required this.deTipoDoc,
    required this.envDescMotTraslado,
    required this.envFecEntregaAlTransp,
    required this.envFecIniTraslado,
    required this.envModTraslado,
    required this.envMotivoTraslado,
    required this.envPesoBruto,
    required this.envPesoNeto,
    required this.envUndPesoBruto,
    required this.envUndPesoNeto,
    required this.grFecEmision,
    required this.grHoraEmision,
    this.grNroGuia,
    required this.grVersionDoc,
    required this.grVersionUbl,
    required this.brevete,
    required this.fecArriboCampo,
    required this.fecFinAlce,
    required this.fecIniAlce,
    required this.fecSalidaCampo,
    required this.flagQuema,
    required this.maqAlce,
    required this.nroOrdenCosecha,
    //required this.nroRegistroSap,
    required this.operador,
    required this.placa1,
    this.placa2,
    this.placa3,
    required this.pllDireccion,
    required this.pllUbigeoLlegada,
    required this.ppDireccion,
    required this.ppUbigeoPartida,
    required this.reNroDoc,
    required this.reRazonSocial,
    required this.tipoAlce,
    required this.reTipoDoc,
    required this.ppCodEstablecimiento,
    required this.pllCodEstablecimiento,
    this.trTipoDoc,
    this.trNroDoc,
    this.trRazonSocial,
    this.trNroRegMtc,
    this.veNroPlaca,
    this.caNroPlaca1,
    this.caNroPlaca2,
    required this.operadorSap,
    required this.transportista,
    required this.frenteCosecha,
    required this.codOperador,
    required this.ppNroRuc,
    required this.pllNroRuc,
    this.cpTipoConductor,
    this.cpTipoDoc,
    this.cpNroDoc,
    this.cpApellidosNombres,
    this.cpLicenciaConducir,
    required this.nomTransportista,
  });

  factory Guia1OraModel.fromRawJson(String str) => Guia1OraModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guia1OraModel.fromJson(Map<String, dynamic> json) => Guia1OraModel(
        biCantidad: json["biCantidad"],
        biCodBien: json["biCodBien"],
        biDescBien: json["biDescBien"],
        biUnd: json["biUnd"],
        deNroDoc: json["deNroDoc"],
        deRazonSocial: json["deRazonSocial"],
        deTipoDoc: json["deTipoDoc"],
        envDescMotTraslado: json["envDescMotTraslado"],
        envFecEntregaAlTransp: json["envFecEntregaAlTransp"],
        envFecIniTraslado: json["envFecIniTraslado"],
        envModTraslado: json["envModTraslado"],
        envMotivoTraslado: json["envMotivoTraslado"],
        envPesoBruto: json["envPesoBruto"],
        envPesoNeto: json["envPesoNeto"],
        envUndPesoBruto: json["envUndPesoBruto"],
        envUndPesoNeto: json["envUndPesoNeto"],
        grFecEmision: json["grFecEmision"],
        grHoraEmision: json["grHoraEmision"],
        grNroGuia: json["grNroGuia"],
        grVersionDoc: json["grVersionDoc"],
        grVersionUbl: json["grVersionUbl"],
        brevete: json["brevete"],
        fecArriboCampo: json["fecArriboCampo"],
        fecFinAlce: json["fecFinAlce"],
        fecIniAlce: json["fecIniAlce"],
        fecSalidaCampo: json["fecSalidaCampo"],
        flagQuema: json["flagQuema"],
        maqAlce: json["maqAlce"],
        nroOrdenCosecha: json["nroOrdenCosecha"],
        //nroRegistroSap: json["nroRegistroSap"],
        operador: json["operador"],
        placa1: json["placa1"],
        placa2: json["placa2"],
        placa3: json["placa3"],
        pllDireccion: json["pllDireccion"],
        pllUbigeoLlegada: json["pllUbigeoLlegada"],
        ppDireccion: json["ppDireccion"],
        ppUbigeoPartida: json["ppUbigeoPartida"],
        reNroDoc: json["reNroDoc"],
        reRazonSocial: json["reRazonSocial"],
        tipoAlce: json["tipoAlce"],
        reTipoDoc: json["reTipoDoc"],
        ppCodEstablecimiento: json["ppCodEstablecimiento"],
        pllCodEstablecimiento: json["pllCodEstablecimiento"],
        trTipoDoc: json["trTipoDoc"],
        trNroDoc: json["trNroDoc"],
        trRazonSocial: json["trRazonSocial"],
        trNroRegMtc: json["trNroRegMtc"],
        veNroPlaca: json["veNroPlaca"],
        caNroPlaca1: json["caNroPlaca1"],
        caNroPlaca2: json["caNroPlaca2"],
        operadorSap: json["operadorSap"],
        transportista: json["transportista"],
        frenteCosecha: json["frenteCosecha"],
        codOperador: json["codOperador"],
        ppNroRuc: json["ppNroRuc"],
        pllNroRuc: json["pllNroRuc"],
        cpTipoConductor: json["cpTipoConductor"],
        cpTipoDoc: json["cpTipoDoc"],
        cpNroDoc: json["cpNroDoc"],
        cpApellidosNombres: json["cpApellidosNombres"],
        cpLicenciaConducir: json["cpLicenciaConducir"],
        nomTransportista: json["nomTransportista"],
      );

  Map<String, dynamic> toJson() => {
        "biCantidad": biCantidad,
        "biCodBien": biCodBien,
        "biDescBien": biDescBien,
        "biUnd": biUnd,
        "deNroDoc": deNroDoc,
        "deRazonSocial": deRazonSocial,
        "deTipoDoc": deTipoDoc,
        "envDescMotTraslado": envDescMotTraslado,
        "envFecEntregaAlTransp": envFecEntregaAlTransp,
        "envFecIniTraslado": envFecIniTraslado,
        "envModTraslado": envModTraslado,
        "envMotivoTraslado": envMotivoTraslado,
        "envPesoBruto": envPesoBruto,
        "envPesoNeto": envPesoNeto,
        "envUndPesoBruto": envUndPesoBruto,
        "envUndPesoNeto": envUndPesoNeto,
        "grFecEmision": grFecEmision,
        "grHoraEmision": grHoraEmision,
        "grNroGuia": grNroGuia,
        "grVersionDoc": grVersionDoc,
        "grVersionUbl": grVersionUbl,
        "brevete": brevete,
        "fecArriboCampo": fecArriboCampo,
        "fecFinAlce": fecFinAlce,
        "fecIniAlce": fecIniAlce,
        "fecSalidaCampo": fecSalidaCampo,
        "flagQuema": flagQuema,
        "maqAlce": maqAlce,
        "nroOrdenCosecha": nroOrdenCosecha,
        //"nroRegistroSap": nroRegistroSap,
        "operador": operador,
        "placa1": placa1,
        "placa2": placa2,
        "placa3": placa3,
        "pllDireccion": pllDireccion,
        "pllUbigeoLlegada": pllUbigeoLlegada,
        "ppDireccion": ppDireccion,
        "ppUbigeoPartida": ppUbigeoPartida,
        "reNroDoc": reNroDoc,
        "reRazonSocial": reRazonSocial,
        "tipoAlce": tipoAlce,
        "reTipoDoc": reTipoDoc,
        "ppCodEstablecimiento": ppCodEstablecimiento,
        "pllCodEstablecimiento": pllCodEstablecimiento,
        "trTipoDoc": trTipoDoc,
        "trNroDoc": trNroDoc,
        "trRazonSocial": trRazonSocial,
        "trNroRegMtc": trNroRegMtc,
        "veNroPlaca": veNroPlaca,
        "caNroPlaca1": caNroPlaca1,
        "caNroPlaca2": caNroPlaca2,
        "operadorSap": operadorSap,
        "transportista": transportista,
        "frenteCosecha": frenteCosecha,
        "codOperador": codOperador,
        "ppNroRuc": ppNroRuc,
        "pllNroRuc": pllNroRuc,
        "cpTipoConductor": cpTipoConductor,
        "cpTipoDoc": cpTipoDoc,
        "cpNroDoc": cpNroDoc,
        "cpApellidosNombres": cpApellidosNombres,
        "cpLicenciaConducir": cpLicenciaConducir,
        "nomTransportista": nomTransportista,
      };
}
