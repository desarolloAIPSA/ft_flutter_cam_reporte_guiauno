import 'dart:convert';

import 'package:reporte_guia/src/data/models/sap/maq_alce_model.dart';
import 'package:reporte_guia/src/data/models/sap/tipo_alce_model.dart';

import 'ora/empresa_model.dart';

class Option {
  final String label;
  final String value;

  Option({required this.label, required this.value});

  factory Option.fromRawJson(String str) =>
      Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) =>
      Option(label: json['label'], value: json['value']);

  Map<String, dynamic> toJson() => {
      'label': label,
      'value': value,
    };


  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(other) {
    return other is Option && value == other.value;
  }

   @override
  String toString() {
    return 'Option(label: $label, value: $value)';
  }
}


Option maqConvertToOption(MaquinariaAlceSapModel model) {
  return Option(label: model.lifnr, value: model.zzMaqalce);
}
Option tipoConvertToOption(TipoAlceSapModel model) {
  return Option(label: model.domvalueL, value: model.ddtext);
}

Option empresaConvertToOption(EmpresaOraModel model) {
  return Option(label: model.codMotTraslado.trim(), value: model.nombre);
}
  /* @override
  String toString() {
    return 'Option{label: $label, value: $value}';
  } */